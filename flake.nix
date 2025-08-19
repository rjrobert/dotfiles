{
  description = "Robert's dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux"; # Ubuntu server
    in {
      nixosConfigurations.blackbox = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./blackbox.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.robert = import ./home.nix;
          }
        ];
      };
    };
}
