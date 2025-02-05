args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    enabled
    domains
    ip
    disabled
    ;
  inherit (config.${namespace}.user) host;
  port = 8081;
  state = if (host == "brix") then enabled else disabled;
  value = {
    services = {
      scrutiny = state // {
        openFirewall = true;
        collector = enabled // {
          schedule = "*:0/15";
          settings = {
            host.id = host;
            api.endpoint =
              let
                _host = if (host == "brix") then "localhost" else ip.brix;
              in
              "http://${_host}:${toString port}";
          };
        };
        settings.web.listen.port = port;
      };
      caddy = state // {
        virtualHosts = {
          "http://${domains.scrutiny}".extraConfig = ''
            reverse_proxy http://localhost:${toString port}
          '';
        };
      };
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
