{ pkgs, ... }:

let
  gruvboxPlus = import ./gruvbox-plus.nix { inherit pkgs; };
in
{
  home.file.".config/gtk-4.0/gtk.css".source = ./gtk.css;
  home.file.".config/gtk-3.0/gtk.css".source = ./gtk.css;

  home.file = {
    ".local/share/icons/GruvboxPlus".source = "${gruvboxPlus}";
  };

  gtk = {
    enable = true;

    font.name = "Helvetica Neue LT Std 11";

    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Modern-Ice";

    theme.package = pkgs.adw-gtk3;
    theme.name = "adw-gtk3";

    iconTheme.name = "GruvboxPlus";
    iconTheme.package = gruvboxPlus;
  };
}
