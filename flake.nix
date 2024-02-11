{
  description = "Oliver nixos";

  inputs = {
    nixpkgs.url = "nixpkgs/release-23.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... } @ inputs: 
    let
      # Configure pkgs
      lib = nixpkgs.lib;
      system  = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = import nixpkgs-unstable {
        system = system;
        config = {
          allowUnfree = true;
        };
      };
    in {
      nixosConfigurations = {

        oliverLpt = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit pkgs-unstable; };
          modules = [
            ./hosts/laptop
            ./system
          ];
        };

        oliverPC = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit pkgs-unstable; };
          modules = [
            ./hosts/pcIbk
            ./system
          ];
        };

      };
    };
}
