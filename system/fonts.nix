{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    inter
    helvetica-neue-lt-std
    jetbrains-mono
    nerdfonts
    font-awesome
  ];
}
