args:
let
  inherit (args) namespace lib _name;
  inherit (lib.${namespace})
    nixosModule
    domains
    enabled
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  port = 7745;
  name = getDirname _name;
  value = {
    services = {
      homebox = enabled // {
        settings = {
          HBOX_STORAGE_DATA = "/var/lib/homebox/data";
          HBOX_STORAGE_SQLITE_URL = "/var/lib/homebox/data/homebox.db?_pragma=busy_timeout=999&_pragma=journal_mode=WAL&_fk=1";
          HBOX_OPTIONS_ALLOW_REGISTRATION = "true";
          HBOX_OPTIONS_CHECK_GITHUB_RELEASE = "false";
          HBOX_MODE = "production";
          HBOX_WEB_PORT = toString port;
        };
      };
      caddy = mkCaddyProxy {
        domain = domains.${name};
        inherit port;
      };
    };
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = port;
    };
    networking.firewall.allowedTCPPorts = [ port ];
  };
  _args = { inherit value args; };
in
nixosModule _args
