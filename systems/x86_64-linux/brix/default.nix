{
  lib,
  namespace,
  config,
  ...
}:
let
  inherit (lib.${namespace}) enabled disabled enabledList;
  user = (config.${namespace}.user).name;
in
{
  imports = [ ./hardware-configuration.nix ];

  dot = {
    user.host = "brix";
    boot.systemd = enabled;
    common = enabled;
    nfs = enabled;
    caddy = enabled // {
      xcaddy = enabled;
    };
    logrotate = enabled;
    soft-serve = enabled;
    firewall = enabledList [
      "docker"
      "mdns"
      "nfs"
      "syncthing"
    ];
    docker =
      let
        nfs = "brix.local";
        mount = "/home/${user}/mnt/nfs/docker/syncthing_sync";
      in
      enabled
      // {
        subconverter = enabled // {
          ports = 25500;
          inherit nfs;
          version = "0.9.0";
        };
        e5 = enabled // {
          ports = 1066;
          inherit nfs;
          version = "latest";
        };
        atuin = enabled // {
          ports = 8888;
          inherit nfs;
          version = "v18.3.0";
        };
        syncthing = enabled // {
          ports = [
            8384
            22000
            21027
          ];
          inherit nfs;
          version = "version-v1.27.9";
        };
        alist = enabled // {
          ports = 5244;
          inherit nfs;
          version = "v3.35.0";
          duckdns = enabled;
        };
        flaresolverr = enabled // {
          ports = 8191;
          version = "v3.3.21";
        };
        ariang = enabled // {
          ports = 8080;
          version = "1.3.7";
        };
        kavita = enabled // {
          ports = 5001;
          inherit nfs mount;
          version = "0.8.2";
        };
        miniflux = enabled // {
          ports = 5002;
          inherit nfs;
          version = "2.1.4";
        };
        qd = enabled // {
          ports = 8923;
          inherit nfs;
          version = "20240210";
        };
        dufs = enabled // {
          ports = 5003;
          inherit nfs;
          version = "v0.41.0";
        };
        pairdrop = enabled // {
          ports = 5004;
          version = "1.10.9";
        };
        rustypaste = enabled // {
          ports = 8000;
          inherit nfs;
          version = "sha-1d5a9c6";
        };
        vaultwarden = enabled // {
          ports = 5005;
          inherit nfs;
          version = "1.32.0-alpine";
          duckdns = enabled;
        };
      };
  };

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "23.11";
}
