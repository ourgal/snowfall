args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    enabled
    xyzDomains
    domains
    cloudflaredTunnelID
    ;
  value = {
    services.cloudflared = enabled // {
      certificateFile = config.sops.secrets."cloudflared/cert".path;
      tunnels = {
        "${cloudflaredTunnelID.vaultwarden}" =
          let
            name = "vaultwarden";
          in
          {
            default = "http_status:404";
            credentialsFile = config.sops.secrets."cloudflared/xyz".path;
            originRequest.httpHostHeader = domains.${name};
            ingress = {
              "${xyzDomains.${name}}" = {
                service = "http://${domains.${name}}:80";
              };
            };
          };
        "${cloudflaredTunnelID.navidrome}" =
          let
            name = "navidrome";
          in
          {
            default = "http_status:404";
            credentialsFile = config.sops.secrets."cloudflared/${name}".path;
            originRequest.httpHostHeader = domains.${name};
            ingress = {
              "${xyzDomains.${name}}" = {
                service = "http://${domains.${name}}:80";
              };
            };
          };
        "${cloudflaredTunnelID.jellyfin}" =
          let
            name = "jellyfin";
          in
          {
            default = "http_status:404";
            credentialsFile = config.sops.secrets."cloudflared/${name}".path;
            originRequest.httpHostHeader = domains.${name};
            ingress = {
              "${xyzDomains.${name}}" = {
                service = "http://${domains.${name}}:80";
              };
            };
          };
        "${cloudflaredTunnelID.miniflux}" =
          let
            name = "miniflux";
          in
          {
            default = "http_status:404";
            credentialsFile = config.sops.secrets."cloudflared/${name}".path;
            originRequest.httpHostHeader = domains.${name};
            ingress = {
              "${xyzDomains.${name}}" = {
                service = "http://${domains.${name}}:80";
              };
            };
          };
        "${cloudflaredTunnelID.anki}" =
          let
            name = "anki";
          in
          {
            default = "http_status:404";
            credentialsFile = config.sops.secrets."cloudflared/${name}".path;
            originRequest.httpHostHeader = domains.${name};
            ingress = {
              "${xyzDomains.${name}}" = {
                service = "http://${domains.${name}}:80";
              };
            };
          };
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
