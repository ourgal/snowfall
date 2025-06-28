{ pkgs, ... }:
{
  home.packages = with pkgs; [ dufs ];
}
