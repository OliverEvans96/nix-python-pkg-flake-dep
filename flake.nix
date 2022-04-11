{
  inputs = {
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flower-power.url = "github:oliverevans96/nix-python-library-example";
  };
  outputs = { self, nixpkgs-unstable, flake-utils, flower-power }:
    let
      pkgs = nixpkgs-unstable.legacyPackages.x86_64-linux;
      projectDir = ./.;
      python = pkgs.python38;
      botanizer = with python.pkgs; buildPythonPackage {
        name = "botanizer";
        src = ./.;
        propagatedBuildInputs = [
          flower-power
        ];
      };
    in flake-utils.lib.eachDefaultSystem (system: {
      defaultPackage = botanizer;
      devShell = pkgs.mkShell {
        buildInputs = [
          (python.withPackages (ps: [ botanizer ]))
        ];
      };
    });
}
