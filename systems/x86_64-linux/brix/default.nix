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
    ;
  user = config.${namespace}.user.name;
in
{
  imports = [ ./hardware-configuration.nix ];

  dot =
    {
      user.host = "brix";
      boot.systemd = enabled;
      sops-nix = enabled // {
        ssh = enabled;
      };
      postgres-update = disabled;
      firewall.disable = enabled;
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
      "atuin"
      "bpftune"
      "caddy"
      "common"
      "dufs"
      "firehol"
      "flaresolverr"
      "homebox"
      "immich"
      "jackett"
      "jellyfin"
      "komga"
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

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "23.11";
}
