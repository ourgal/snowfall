args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled domains;
  port = 8084;
  name = "komga";
  value = {
    services = {
      komga = enabled // {
        openFirewall = true;
        inherit port;
      };
      caddy = enabled // {
        virtualHosts = {
          "http://${domains.komga}".extraConfig = ''
            reverse_proxy http://localhost:${toString port}
          '';
        };
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
