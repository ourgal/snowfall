args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled domains;
  port = 5002;
  user = "miniflux";
  name = "miniflux";
  value = {
    sops.secrets."miniflux/adminCredentialsFile".owner = user;
    services = {
      miniflux = enabled // {
        config = {
          POLLING_PARSING_ERROR_LIMIT = 0;
          LISTEN_ADDR = "localhost:${toString port}";
        };
        adminCredentialsFile = config.sops.secrets."miniflux/adminCredentialsFile".path;
      };
      postgresqlBackup.databases = [ "miniflux" ];
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
        "http://${domains.miniflux}".extraConfig = ''
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
