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
    firewall = enabledList [
      "docker"
      "mdns"
      "nfs"
    ];
    docker =
      let
        nfs = "brix.local";
        mount = "/home/${user}/.local/share/syncthing";
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
        kavita = enabled // {
          ports = 5000;
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
