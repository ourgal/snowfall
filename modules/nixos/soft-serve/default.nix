args:
let
  inherit (args)
    namespace
    lib
    config
    pkgs
    ;
  inherit (lib.${namespace})
    nixosModule
    enabled
    domains
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  inherit (config.${namespace}.user) host;
  cfg = config.services.soft-serve;
  format = pkgs.formats.yaml { };
  sshPort = 23231;
  gitPort = 9418;
  httpPort = 23232;
  statsPort = 23233;
  name = getDirname path;
  configFile = format.generate "config.yaml" cfg.settings;
  value = {
    services = {
      soft-serve = enabled // {
        settings = {
          name = "Soft Serve";
          log_format = "text";
          ssh = {
            listen_addr = ":${toString sshPort}";
            public_url = "ssh://${host}.local:${toString sshPort}";
            key_path = "ssh/soft_serve_host";
            client_key_path = "ssh/soft_serve_client";
            max_timeout = 0;
            idle_timeout = 120;
          };
          git = {
            listen_addr = ":${toString gitPort}";
            max_timeout = 0;
            idle_timeout = 3;
            max_connections = 32;
          };
          http = {
            listen_addr = ":${toString httpPort}";
            tls_key_path = "";
            tls_cert_path = "";
            public_url = "http://${host}.local:${toString httpPort}";
          };
          db = {
            driver = "sqlite";
            data_source = "soft-serve.db?_pragma=busy_timeout(5000)&_pragma=foreign_keys(1)";
          };
          lfs = {
            enabled = true;
            ssh_enabled = true;
          };
          jobs = {
            mirror_pull = "@every 15m";
          };
          stats = {
            listen_addr = ":${toString statsPort}";
          };
          initial_admin_keys = builtins.attrValues config.${namespace}.user.sshKeys;
        };
      };
      caddy = mkCaddyProxy {
        domain = domains.${name};
        port = httpPort;
      };
      borgmatic.settings.source_directories = [ "/var/lib/private/${name}" ];
    };
    networking.firewall = {
      allowedTCPPorts = [
        sshPort
        httpPort
        gitPort
        statsPort
      ];
    };
    systemd.tmpfiles.rules = [ "L+ /var/lib/private/soft-serve/config.yaml - - - - ${configFile}" ];
    systemd.services.soft-serve.environment._reloadConfig = "${configFile}";
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = [
        sshPort
        httpPort
        gitPort
        statsPort
      ];
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
