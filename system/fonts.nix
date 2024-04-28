{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    inter
    jetbrains-mono
    nerdfonts
    font-awesome
  ];
}
