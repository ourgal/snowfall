args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled;
  inherit (config.${namespace}.user) host;
  value = {
    services.soft-serve = enabled // {
      settings = {
        name = "Soft Serve";
        log_format = "text";
        ssh = {
          listen_addr = ":23231";
          public_url = "ssh://${host}.local:23231";
          key_path = "ssh/soft_serve_host";
          client_key_path = "ssh/soft_serve_client";
          max_timeout = 0;
          idle_timeout = 120;
        };
        git = {
          listen_addr = ":9418";
          max_timeout = 0;
          idle_timeout = 3;
          max_connections = 32;
        };
        http = {
          listen_addr = ":23232";
          tls_key_path = "";
          tls_cert_path = "";
          public_url = "http://${host}.local:23232";
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
          mirror_pull = "@every 10m";
        };
        stats = {
          listen_addr = ":23233";
        };
        initial_admin_keys = builtins.attrValues config.${namespace}.user.sshKeys;
      };
    };
    networking.firewall = {
      allowedTCPPorts = [
        23232
        23231
        23233
        9418
      ];
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
