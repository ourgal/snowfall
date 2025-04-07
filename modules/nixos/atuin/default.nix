args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace})
    nixosModule
    enabled
    domains
    mkCaddyProxy
    mkFireholRule
    getDirname
    ;
  port = 8888;
  name = getDirname path;
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
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
