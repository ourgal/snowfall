args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    ;
  inherit (lib.${namespace})
    nixosModule
    mkOpt'
    getDirname
    commonServiceConfig
    cfgNixos
    mkFireholRule
    domains
    mkCaddyProxy
    capitalize
    ;
  cfg = cfgNixos config.${namespace} ./.;
  name = getDirname path;
  dataDir = "/var/opt/${name}";
  value = {
    systemd.services.${name} = {
      description = "${capitalize name} Service";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      environment = {
        MEMOS_MODE = "prod";
        MEMOS_PORT = toString cfg.port;
      };

      serviceConfig = commonServiceConfig // {
        ExecStart = lib.getExe pkgs.${name};
        StateDirectory = name;
        SyslogIdentifier = name;
        RuntimeDirectory = name;
        User = name;
        Group = name;
      };
    };

    systemd.tmpfiles.rules = [ "d ${dataDir} 0700 ${name} ${name} - -" ];

    services.caddy = mkCaddyProxy {
      domain = domains.${name};
      inherit (cfg) port;
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
    port = mkOpt' lib.types.port 5230;
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
