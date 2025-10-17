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
  imports = [ ./hardware-configuration.nix ];

  dot = {
    user.host = name;
    boot.systemd = enabled;
    sops-nix = enabled // {
      ssh = enabled;
    };
    postgres-update = disabled;
    docker =
      let
        nfs = if config.services.resolved.enable then "brix.local" else ip.brix;
      in
      enabled
      // {
        subconverter = enabled // {
          inherit nfs;
        };
        alist = enabled // {
          inherit nfs;
          duckdns = enabled;
        };
        qd = enabled // {
          ports = 8923;
          inherit nfs;
        };
      };
    podman = disabled // { };
  }
  // enabledList [
    # keep-sorted start
    "anki-sync-server"
    "ariang"
    "avahi"
    "bpftune"
    "caddy"
    "common"
    "dufs"
    "flaresolverr"
    "harmonia"
    "homebox"
    "jackett"
    "jellyfin"
    "logrotate"
    "memos"
    "metacubexd"
    "miniflux"
    "navidrome"
    "nfs"
    "nh"
    "pairdrop"
    "postgresqlBackup"
    "rustypaste"
    "scrutiny"
    "soft-serve"
    "sonarr"
    "syncthing"
    "transmission"
    "tuptime"
    "vaultwarden"
    "vsftpd"
    "yacd"
    "zashboard"
    # keep-sorted end
  ];

  system.stateVersion = "23.11";
}
