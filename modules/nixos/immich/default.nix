args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace})
    nixosModule
    enabled
    domains
    disabled
    ;
  port = 2283;
  value = {
    services = {
      immich = enabled // {
        openFirewall = true;
        inherit port;
        machine-learning = disabled;
      };
      caddy = enabled // {
        virtualHosts = {
          "http://${domains.immich}".extraConfig = ''
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
