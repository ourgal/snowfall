args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled;
  inherit (config.services.flaresolverr) port;
  value = {
    services.flaresolverr = enabled // {
      openFirewall = true;
    };
    services.caddy = enabled // {
      virtualHosts = {
        "http://flaresolverr.zxc.cn".extraConfig = ''
          reverse_proxy http://localhost:${toString port}
        '';
      };
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
