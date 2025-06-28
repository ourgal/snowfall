{ pkgs, ... }:
{
  home.packages = with pkgs; [
    btop
    htop
    gawk
  ];
}
