args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled domains;
  port = 9117;
  value = {
    services = {
      jackett = enabled // {
        openFirewall = true;
        inherit port;
      };
      caddy = enabled // {
        virtualHosts = {
          "http://${domains.jackett}".extraConfig = ''
            reverse_proxy http://localhost:${toString port}
          '';
        };
      };
    };
    ${namespace}.user.ports = [ port ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
