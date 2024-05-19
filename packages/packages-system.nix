#-------------------------------------
# System Packages.
# ------------------------------------

{ pkgs, ... }:

{
  # Define list of system packages.
  environment.systemPackages = with pkgs; [
    home-manager # Nix home manager.

    kitty # Terminal.
    zsh # Shell - default.
    bash # Shell.

    hyprland # Window manager.
    hyprpaper
    waybar # Wayland status bar.
    xfce.thunar
    nightfox-gtk-theme # Theme.
    gruvbox-dark-icons-gtk
    bibata-cursors
    wl-clipboard # Add clipboard support.
    clipman # Clipboard manager.
    rofi-wayland # App launcher.
    rofi-bluetooth # Bluetooth control via Rofi.
    nwg-dock-hyprland # Dock.

    tlp # For battery management.
    brightnessctl # Handles brightness.
    upower # For power monitoring.
    git
    gtk4
    unzip
    fd # Fast find.
    lshw # Prints hardware info.
    xorg.xev # Event monitor.
    htop
    thefuck # Correct previous terminal command.

    neovim
    tmux
    tmuxifier
    zoxide
    ripgrep
    fzf
    stylua # LSP Formatter for Lua.
    rocmPackages.llvm.clang # C compiler.
    nodejs_21 # Node JS.
    nodePackages.prettier # Prettier formatter.
    python3 # Python.
    cargo # Rust package manager.

    docker-compose
  ];
}
