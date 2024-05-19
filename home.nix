#-------------------------------------
# Home manager.
# ------------------------------------
# Mostly using this just for managing
# configs and dotfiles at the moment.
#-------------------------------------

{ nix-colors, ... }:

{
  imports = [
    # User name and home directory.
    ./users/adam-home.nix

    # User packages.
    ./packages/packages-home.nix

    # User packages configs.
    ./packages/kitty/kitty.nix # Terminal.
    ./packages/waybar/waybar.nix # Status Bar.
    ./packages/rofi/rofi.nix # Rofi.
    ./packages/hyprland/hyprland-home.nix # Hyprland config.
    ./packages/hyprpaper/hyprpaper.nix # Hyprpaper config.
    ./packages/dock/dock.nix # Dock.
    ./packages/git/git.nix # Git config.
    ./packages/gtk/gtk.nix
    nix-colors.homeManagerModules.default
  ];

  colorScheme = nix-colors.colorSchemes.tokyo-night-dark;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # You should not change this value, even if you update Manager. If you do
  # want to update the value, then make sure to first check the Manager
  # release notes.
  home.stateVersion = "23.11";
}
