args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    enabled
    xyzDomain
    domain
    cloudflaredTunnelID
    ;
  value = {
    services.cloudflared = enabled // {
      certificateFile = config.sops.secrets."cloudflared/cert".path;
      tunnels = {
        "${cloudflaredTunnelID}" = {
          default = "http_status:404";
          credentialsFile = config.sops.secrets."cloudflared/xyz".path;
          originRequest.httpHostHeader = "vaultwarden.${domain}";
          ingress = {
            "vaultwarden.${xyzDomain}" = {
              service = "http://vaultwarden.${domain}:80";
            };
          };
        };
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
