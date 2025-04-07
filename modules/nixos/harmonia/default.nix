args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    enabled
    getDirname
    domains
    ip
    mkFireholRule
    ;
  port = 50000;
  name = getDirname path;
  value = {
    environment.etc = {
      "${name}/secret".source = ./secret.key;
    };
    services = {
      harmonia = enabled // {
        settings = {
          bind = "[::]:${toString port}";
          workers = 4;
          max_connection_rate = 256;
          priority = 30;
        };
        signKeyPaths = [ "/etc/${name}/secret" ];
      };
      caddy = {
        virtualHosts = {
          "http://${domains.${name}}".extraConfig = ''
            reverse_proxy http://${if config.services.resolved.enable then "home.local" else ip.home}:50000
          '';
        };
      };
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
