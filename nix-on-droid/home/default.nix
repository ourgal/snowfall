{ pkgs, ... }:
{
  home.stateVersion = "24.05";

  programs = {
    fish.enable = true;
    git.enable = true;
    fzf.enable = true;
    ssh = {
      enable = true;
      package = pkgs.openssh;
    };
  };
  home.packages = with pkgs; [
    btop
    htop
    dufs
  ];
}
