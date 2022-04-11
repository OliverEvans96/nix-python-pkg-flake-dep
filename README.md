# Nix Python Package with Flake Dependency

This is a simple python package that depends on another package through nix flakes (instead of pip).

To verify that it works, clone the repo and run the following command from the root:

```
nix-shell --command "python -c 'from botanizer import *; print(print_many_flowers())'"
```

