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
    ;
  user = config.${namespace}.user.name;
in
{
  imports = [ ./hardware-configuration.nix ];

  dot = {
    user.host = "brix";
    boot.systemd = enabled;
    common = enabled;
    sops-nix = enabled;
    nfs = enabled;
    caddy = enabled // {
      xcaddy = enabled;
    };
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
    firewall = enabledList [
      "docker"
      "mdns"
      "nfs"
    ];
    docker =
      let
        nfs = "brix.local";
      in
      enabled
      // {
        subconverter = enabled // {
          ports = 25500;
          inherit nfs;
          inherit (sources.docker-subconverter) version;
        };
        e5 = enabled // {
          ports = 1066;
          inherit nfs;
          version = "latest";
        };
        alist = enabled // {
          ports = 5244;
          inherit nfs;
          inherit (sources.docker-alist) version;
          duckdns = enabled;
        };
        flaresolverr = enabled // {
          ports = 8191;
          inherit (sources.docker-flaresolverr) version;
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
