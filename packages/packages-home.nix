#-------------------------------------
# Home Packages.
# ------------------------------------

{ pkgs, ... }:

{
  # Define list of user packages.
  home.packages = with pkgs; [
    firefox
    spotify
    _1password
    _1password-gui
  ];
}
