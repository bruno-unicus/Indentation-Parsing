# Installing haskell packages on Nix 

https://haskell4nix.readthedocs.io/nixpkgs-users-guide.html

## Query:

```sh
nix-env -f "<nixpkgs>" -qaP -A haskellPackages
```

## Install:

```sh
nix-env -f "<nixpkgs>" -iA haskellPackages.MissingH
```

