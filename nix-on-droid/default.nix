{
  config,
  lib,
  pkgs,
  ...
}:
let
  sshd-start =
    let
      sshdDirectory = "${config.user.home}/.ssh";
      port = 8022;
    in
    pkgs.writeScriptBin "sshd-start" ''
      #!${pkgs.runtimeShell}

      echo "Starting sshd in non-daemonized way on port ${toString port}"
      ${pkgs.openssh}/bin/sshd -f "${sshdDirectory}/sshd_config"
    '';
in
{
  user.shell = lib.getExe pkgs.fish;

  environment = {
    packages = with pkgs; [
      vim
      curl
      sshd-start
      iproute2
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
