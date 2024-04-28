#-------------------------------------
# NixOS Configuration.
# ------------------------------------
# Handles hardware and system level
# package configuration.
#-------------------------------------

{
  imports = [
    # Hardware config, created automatically, do not edit.
    ./system/hardware-configuration.nix

    # System setup.
    ./system/boot.nix # Bootloader.
    ./system/bluetooth.nix # Bluetooth.
    ./system/networking.nix # Networking.
    ./system/battery.nix # Battery profiles and config.
    ./system/i18n.nix # Internationalization.
    ./system/audio.nix # Audio.
    ./system/printing.nix # Print.
    ./system/timezone.nix # Timezone.
    ./system/fingerprint-scanner.nix # Fingerprint scanner.
    ./system/fonts.nix
    ./system/security.nix

    # User Profiles.
    ./users/adam.nix

    # System wide packages.
    ./packages/packages-system.nix

    # System wide package configs.
    ./packages/shells/sh.nix # Shell configs.
    ./packages/xremap/xremap-flake.nix # Xremap flake.
    ./packages/xremap/xremap.nix # Keyboard remaps.
    ./packages/1password/1password.nix # Password Manager.
    ./packages/hyprland/hyprland-nixpkgs.nix # Hyprland window manager.
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
