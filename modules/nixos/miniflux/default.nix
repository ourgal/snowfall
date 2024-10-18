args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  port = 5002;
  user = "miniflux";
  value = {
    sops.secrets."miniflux/adminCredentialsFile".owner = user;
    services.miniflux = enabled // {
      config = {
        POLLING_PARSING_ERROR_LIMIT = 0;
        LISTEN_ADDR = "localhost:${toString port}";
      };
      adminCredentialsFile = "/run/secrets/miniflux/adminCredentialsFile";
    };
    users = {
      users.${user} = {
        description = "miniflux service user";
        isSystemUser = true;
        group = user;
      };
      groups.${user} = { };
    };
    services.caddy = enabled // {
      virtualHosts = {
        "http://miniflux.zxc.cn".extraConfig = ''
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
