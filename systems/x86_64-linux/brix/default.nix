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
    enabledList
    sources
    ip
    ;
  user = config.${namespace}.user.name;
in
{
  imports = [ ./hardware-configuration.nix ];

  dot = {
    user.host = "brix";
    boot.systemd = enabled;
    common = enabled;
    nh = enabled;
    sops-nix = enabled;
    nfs = enabled;
    caddy = enabled;
    logrotate = enabled;
    soft-serve = enabled;
    atuin = enabled;
    syncthing = enabled;
    ariang = enabled;
    dufs = enabled;
    pairdrop = enabled;
    rustypaste = enabled;
    miniflux = enabled;
    kavita = enabled;
    vaultwarden = enabled;
    anki-sync-server = enabled;
    firewall = enabledList [
      "docker"
      "mdns"
      "nfs"
    ];
    tuptime = enabled;
    flaresolverr = enabled;
    vsftpd = enabled;
    transmission = enabled;
    navidrome = enabled;
    jellyfin = enabled;
    sonarr = enabled;
    metacubexd = enabled;
    scrutiny = enabled;
    jackett = enabled;
    zashboard = enabled;
    bpftune = enabled;
    immich = enabled;
    postgres-update = disabled;
    yacd = enabled;
    docker =
      let
        nfs = if config.services.resolved.enable then "brix.local" else ip.brix;
      in
      enabled
      // {
        subconverter = enabled // {
          ports = 25500;
          inherit nfs;
          inherit (sources.docker-subconverter) version;
        };
        alist = enabled // {
          ports = 5244;
          inherit nfs;
          inherit (sources.docker-alist) version;
          duckdns = enabled;
        };
        qd = enabled // {
          ports = 8923;
          inherit nfs;
          inherit (sources.docker-qd) version;
        };
      };
  };

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "23.11";
}
