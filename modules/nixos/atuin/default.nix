args:
let
  inherit (args) namespace lib _name;
  inherit (lib.${namespace})
    nixosModule
    enabled
    domains
    mkCaddyProxy
    mkFireholRule
    getDirname
    ;
  port = 8888;
  name = getDirname _name;
  value = {
    services = {
      atuin = enabled // {
        openFirewall = true;
        openRegistration = true;
        host = "0.0.0.0";
        inherit port;
      };
      postgresql = enabled;
      postgresqlBackup.databases = [ "atuin" ];
      caddy = mkCaddyProxy {
        domain = domains.${name};
        inherit port;
      };
    };
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = port;
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
