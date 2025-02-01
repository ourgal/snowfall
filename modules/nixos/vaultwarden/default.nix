args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled domains;
  port = 8222;
  value = {
    sops.secrets."vaultwarden/adminToken".owner = "vaultwarden";
    services.vaultwarden = enabled // {
      config = {
        ROCKET_ADDRESS = "::1";
        ROCKET_PORT = port;
      };
      environmentFile = "/run/secrets/vaultwarden/adminToken";
    };
    services.caddy =
      let
        inherit (config.${namespace}.user.duckdns) token domain;
      in
      enabled
      // {
        virtualHosts = {
          "http://${domains.vaultwarden}".extraConfig = ''
            reverse_proxy http://localhost:${toString port}
          '';
          "vaultwarden.${domain}.duckdns.org".extraConfig = ''
            tls {
                dns duckdns ${token}
            }
            reverse_proxy http://localhost:${toString port}
          '';
        };
      };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
