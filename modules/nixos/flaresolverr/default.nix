args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled domains;
  port = 8191;
  value = {
    services.flaresolverr = enabled // {
      openFirewall = true;
    };
    services.caddy = enabled // {
      virtualHosts = {
        "http://${domains.flaresolverr}".extraConfig = ''
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
