{ pkgs, ... }:

{
  gtk = {
    enable = true;
    font.name = "Helvetica Neue LT Std 11";
    theme = {
      name = "Nightfox-Dusk-BL";
      package = pkgs.nightfox-gtk-theme;
    };
    iconTheme = {
      name = "Whitesur-icon-theme";
      package = pkgs.whitesur-icon-theme;
    };
  };
}
