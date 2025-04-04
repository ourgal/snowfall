args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule domains enabled;
  port = 3456;
  name = "tiddlywiki";
  value = {
    services = {
      tiddlywiki = enabled // {
        listenOptions = { inherit port; };
      };
      caddy = enabled // {
        virtualHosts = {
          "http://${domains.tiddlywiki}".extraConfig = ''
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
