{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-06cb-009a-fingerprint-sensor = {
      url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap-flake.url = "github:xremap/nix-flake";

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgsUnstable = nixpkgs-unstable.legacyPackages.${system};
    in
    {
      # System config.
      nixosConfigurations = {
        nixos-hyprland = lib.nixosSystem {
          system = system;

          specialArgs = {
            inherit (inputs) xremap-flake;
            inherit (inputs) nix-colors;
            inherit (inputs) nixos-06cb-009a-fingerprint-sensor;
            inherit pkgsUnstable;
          };

          modules = [
            ./configuration.nix
          ];
        };
      };

      # Home Manager config.
      homeConfigurations = {
        adam = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit (inputs) nix-colors;
          };

          modules = [
            ./home.nix
          ];
        };
      };
    };
}
