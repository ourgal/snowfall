args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled domains;
  port = 8191;
  name = "flaresolverr";
  value = {
    services.flaresolverr = enabled // {
      openFirewall = true;
      package = pkgs.nur.repos.xddxdd.flaresolverr-21hsmw;
    };
    services.caddy = enabled // {
      virtualHosts = {
        "http://${domains.flaresolverr}".extraConfig = ''
          reverse_proxy http://localhost:${toString port}
        '';
      };
    };
    ${namespace} = {
      user.ports = [ port ];
      firehol.services = [
        {
          inherit name;
          tcp = port;
        }
      ];
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
