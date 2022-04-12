{
  inputs = {
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flower-power.url = "github:oliverevans96/nix-python-library-example";
  };
  outputs = { self, nixpkgs-unstable, flake-utils, flower-power }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs-unstable.legacyPackages.x86_64-linux;
        projectDir = ./.;
        python = pkgs.python38;
        finalPython = python.override {
          packageOverrides = flower-power.overlay.${system};
        };
        pythonPackages = finalPython.pkgs;
        botanizer = pythonPackages.buildPythonPackage {
          name = "botanizer";
          src = ./.;
          propagatedBuildInputs = [ pythonPackages.flower-power ];
        };
      in {
        defaultPackage = botanizer;
        devShell = pkgs.mkShell {
          buildInputs = [ (python.withPackages (ps: [ botanizer ])) ];
        };
      });
}
