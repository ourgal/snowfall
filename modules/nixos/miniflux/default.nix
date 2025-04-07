args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    enabled
    domains
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  port = 5002;
  name = getDirname path;
  user = name;
  value = {
    sops.secrets."${name}/adminCredentialsFile".owner = user;
    services = {
      miniflux = enabled // {
        config = {
          POLLING_PARSING_ERROR_LIMIT = 0;
          LISTEN_ADDR = "localhost:${toString port}";
        };
        adminCredentialsFile = config.sops.secrets."${name}/adminCredentialsFile".path;
      };
      postgresqlBackup.databases = [ name ];
      caddy = mkCaddyProxy {
        domain = domains.${name};
        inherit port;
      };
    };
    users = {
      users.${user} = {
        description = "miniflux service user";
        isSystemUser = true;
        group = user;
      };
      groups.${user} = { };
    };
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = port;
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
