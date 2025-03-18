args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    ;
  inherit (lib.${namespace})
    nixosModule
    mkDockerProxy
    enabled
    cfgNixos
    switch
    mkDockerProxyDuckdns
    ip
    domains
    ;
  cfg = cfgNixos config.${namespace} ./.;
  inherit (config.${namespace}) docker;
  host = ip.brix;
  ports = [
    80
    443
  ];
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
      // (mkDockerProxyDuckdns {
        inherit
          docker
          host
          domain
          token
          ;
      })
    else
      mkDockerProxy { inherit docker host; };
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
      virtualHosts = virtualHosts // {
        "http://${domains.harmonia}".extraConfig = ''
          reverse_proxy http://${if config.services.resolved.enable then "home.local" else ip.home}:50000
        '';
        "http://${domains.yacd}".extraConfig = ''
          reverse_proxy http://192.168.123.1:9999
        '';
      };
      inherit package;
    };
    networking.firewall.allowedTCPPorts = ports;
    ${namespace}.user.ports = ports;
  };
  extraOpts = {
    xcaddy = switch;
  };
  path = ./.;
  _args = {
    inherit
      value
      path
      args
      extraOpts
      ;
  };
in
nixosModule _args
