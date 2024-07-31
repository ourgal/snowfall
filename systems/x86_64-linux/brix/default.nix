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
    caddy = enabled;
    logrotate = enabled;
    firewall = enabledList [
      "docker"
      "mdns"
      "nfs"
      "syncthing"
    ];
    docker =
      let
        nfs = "/net/brix.local/srv/nfs/docker/";
        nfsRoot = "/net/brix.local/srv/nfs/";
      in
      enabled
      // {
        freshrss = enabled // {
          port = 5000;
          inherit nfs;
          version = "1.24.1";
        };
        subconverter = enabled // {
          port = 25500;
          inherit nfs;
          version = "0.9.0";
        };
        e5 = enabled // {
          port = 1066;
          inherit nfs;
          version = "latest";
        };
        soft-serve = enabled // {
          port = [
            23232
            23231
            23233
            9418
          ];
          inherit nfs;
          version = "v0.7.4";
        };
        atuin = enabled // {
          port = 8888;
          inherit nfs;
          version = "v18.3.0";
        };
        syncthing = enabled // {
          port = [
            8384
            22000
            21027
          ];
          inherit nfs;
          version = "version-v1.27.9";
        };
        alist = enabled // {
          port = 5244;
          inherit nfs;
          version = "v3.35.0";
        };
        flaresolverr = enabled // {
          port = 8191;
          version = "v3.3.21";
        };
        ariang = enabled // {
          port = 8080;
          version = "1.3.7";
        };
        kavita = enabled // {
          port = 5001;
          inherit nfs nfsRoot;
          version = "0.8.2";
        };
      };
  };

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "23.11";
}
