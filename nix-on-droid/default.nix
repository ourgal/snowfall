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
      ${pkgs.openssh}/bin/sshd -p ${toString port} -f "${sshdDirectory}/sshd_config"
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

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings = {
      substituters = [
        "http://192.168.123.100:50000?priority=9"
        "https://mirrors.cernet.edu.cn/nix-channels/store?priority=10"
        "https://cache.nixos.org"
        "https://nix-community.cachix.org?priority=100"
      ];
      trusted-public-keys = [ "cache.example.org-1:lFI4YUR1ZKE8dz1JoXTRBvIEHaeKmW3LHBlDTJDW1V8=" ];
    };
  };

  home-manager = {
    config = ./home;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
  };
}
