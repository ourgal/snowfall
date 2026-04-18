{
  lib,
  namespace,
  config,
  ...
}:
let
  inherit (lib.${namespace})
    enabled
    disabled
    ip
    enabledList
    getDirname
    ;
  name = getDirname ./.;
in
{
  imports = [
    ./hardware-configuration.nix
    ./facter.nix
  ];

  dot = {
    user.host = name;
    boot.systemd = enabled;
    sops-nix = enabled // {
      ssh = enabled;
    };
    firewall = {
      aria2 = enabled;
      fossil = enabled;
      transmission = enabled;
    };
    postgres-update = disabled;
    docker =
      let
        nfs = if config.services.resolved.enable then "brix.local" else ip.brix;
      in
      enabled
      // {
        subconverter = enabled;
        alist = enabled;
        rsshub = enabled;
        qd = enabled // {
          ports = 8923;
          inherit nfs;
        };
      };
    podman = disabled // { };
  }
  // enabledList [
    # keep-sorted start
    "aria2"
    "ariang"
    "avahi"
    "bpftune"
    "caddy"
    "common"
    "dufs"
    "flaresolverr"
    "harmonia"
    "jackett"
    "jellyfin"
    "logrotate"
    "miniflux"
    "nfs"
    "nh"
    "postgresqlBackup"
    "scrutiny"
    "soft-serve"
    "sonarr"
    "syncthing"
    "transmission"
    "tuptime"
    "vaultwarden"
    "vsftpd"
    "zashboard"
    # keep-sorted end
  ];

  system.stateVersion = "23.11";
}
