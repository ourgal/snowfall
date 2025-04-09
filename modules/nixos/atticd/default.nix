args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    enabled
    mkOpt'
    cfgNixos
    getDirname
    mkCaddyProxy
    mkFireholRule
    domains
    capitalize
    ;
  cfg = cfgNixos config.${namespace} ./.;
  name = getDirname path;
  value = {
    sops.templates.${name} = {
      content = ''
        ATTIC_SERVER_TOKEN_RS256_SECRET_BASE64="${config.sops.placeholder."${name}/token"}"
      '';
      owner = name;
    };
    services = {
      atticd = enabled // {
        environmentFile = config.sops.templates.${name}.path;
        settings = {
          listen = "[::]:${toString cfg.port}";
          allowed-hosts = [ ];
          storage = {
            type = "local";
            path = "/var/lib/${name}";
          };
          garbage-collection.interval = "0 day";
        };
      };
      caddy = mkCaddyProxy {
        domain = domains.${name};
        inherit (cfg) port;
      };
    };

    users = {
      users.${name} = {
        description = "${capitalize name} Service User";
        home = "/var/lib/${name}";
        createHome = true;
        isSystemUser = true;
        group = name;
      };
      groups.${name} = { };
    };

    ${namespace} = mkFireholRule {
      inherit name;
      tcp = cfg.port;
    };
  };
  extraOpts = {
    port = mkOpt' lib.types.port 8080;
  };
  path = ./.;
  _args = {
    inherit
      value
      path
      args
      extraOpts
      ;
  };
in
nixosModule _args
