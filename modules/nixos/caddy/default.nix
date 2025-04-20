args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    _name
    ;
  inherit (lib.${namespace})
    nixosModule
    mkDockerProxy
    enabled
    cfgNixos
    switch
    mkDockerProxyDuckdns
    ip
    getDirname
    mkFireholRule
    domains
    mkCaddyProxy
    ;
  cfg = cfgNixos config.${namespace} ./.;
  inherit (config.${namespace}) docker;
  inherit (config.${namespace}) podman;
  host =
    let
      default = ip.brix;
      inherit (config.${namespace}.user) host;
    in
    if (default == ip.${host}) then "localhost" else default;
  ports = [
    80
    443
  ];
  name = getDirname _name;
  inherit (config.${namespace}.user.duckdns) token domain;
  xcaddy =
    pkgs.callPackage
      "${builtins.fetchurl {
        url = "https://raw.githubusercontent.com/jpds/nixpkgs/a33b02fa9d664f31dadc8a874eb1a5dbaa9f4ecf/pkgs/servers/caddy/default.nix";
        sha256 = "1x1g6qyhmclz2jyc5nmfjsri3xx4pw5rd15n2xjkxlgdcvywcv5f";
      }}"
      {
        externalPlugins = [
          {
            name = "duckdns";
            repo = "github.com/caddy-dns/duckdns";
            version = "v0.4.0";
          }
        ];
        vendorHash = "sha256-UBn/jQIoi9yq3ZLd+LvDM7PUE0kqP0GKTU+oQIdHztw="; # Add this, as explained in https://github.com/NixOS/nixpkgs/pull/259275#issuecomment-1763478985
      };
  virtualHosts =
    if cfg.xcaddy.enable then
      (mkDockerProxy { inherit docker host; })
      // (mkDockerProxy {
        inherit host;
        docker = podman;
      })
      // (mkDockerProxyDuckdns {
        inherit
          docker
          host
          domain
          token
          ;
      })
    else
      (mkDockerProxy { inherit docker host; })
      // (mkDockerProxy {
        inherit host;
        docker = podman;
      });
  package =
    if cfg.xcaddy.enable then
      xcaddy
    else
      pkgs.caddy.withPlugins {
        plugins = [ "github.com/caddy-dns/duckdns@v0.4.0" ];
        hash = "sha256-K2amMwRcC5ENo/s65khiGYkkpK9asHMC3CTgJ/dWGkg=";
      };
  value = {
    services.caddy = enabled // {
      virtualHosts =
        virtualHosts
        // (mkCaddyProxy {
          domain = domains.harmonia;
          port = 50000;
          host = if config.services.resolved.enable then "home.local" else ip.home;
        }).virtualHosts
        // (mkCaddyProxy {
          domain = domains.restic-server;
          port = 3457;
          host = if config.services.resolved.enable then "home.local" else ip.yanyu;
        }).virtualHosts;
      inherit package;
    };
    networking.firewall.allowedTCPPorts = ports;
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = ports;
    };
  };
  extraOpts = {
    xcaddy = switch;
  };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
