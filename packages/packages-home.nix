#-------------------------------------
# Home Packages.
# ------------------------------------

{ pkgs, ... }:

{
  # Define list of user packages.
  home.packages = with pkgs; [
    discord
    firefox
    spotify
    _1password
    _1password-gui
  ];
}
