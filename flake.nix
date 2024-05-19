{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    stylix.url = "github:danth/stylix";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-06cb-009a-fingerprint-sensor = {
      url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap-flake.url = "github:xremap/nix-flake";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # System config.
      nixosConfigurations = {
        nixos-hyprland = lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit (inputs) xremap-flake;
            inherit (inputs) nixos-06cb-009a-fingerprint-sensor;
          };
          modules = [
            ./configuration.nix
            inputs.stylix.nixosModules.stylix
          ];
        };
      };

      # Home Manager config.
      homeConfigurations = {
        adam = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
          ];
        };
      };
    };
}
