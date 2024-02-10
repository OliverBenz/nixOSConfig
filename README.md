# Documentation for setup

## Mathematica
This is the only annoying application for now.
Before you can install all applications in the configuration.nix, you have to add the mathematica installer to the store: 
- Download the Linux installer. e.g. "Mathematica_14.0.0_BNDL_LINUX.sh"
- Run `nix-store --add-fixed sha256 path/to/installer/Mathematica_14.0.0_BNDL_LINUX.sh`

After this is done, you can just run `nixos-rebuild --flake . switch`.

## Commands
Short overview to some commands I will for sure forget at some point:
- Build first time: `sudo nixos-rebuild --flake .#nameOfProfile switch`
- Rebuild configuration: `sudo nixos-rebuild --flake . switch`
- Build in VM: `sudo nixos-rebuild --flake . build-vm`

The available profiles names that replace `#nameOfProfile` can be seen in the flakes.nix.
Should be:
- oliverPC
- oliverLpt
