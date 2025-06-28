{ lib, pkgs, ... }:
{
  user.shell = lib.getExe pkgs.fish;

  environment = {
    packages = with pkgs; [
      vim
      curl
    ];
    etcBackupExtension = ".bak";
  };

  system.stateVersion = "24.05";

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  home-manager = {
    config = ./home;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
  };
}
