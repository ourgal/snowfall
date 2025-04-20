args:
let
  inherit (args) namespace lib _name;
  inherit (lib.${namespace})
    nixosModule
    enabled
    domains
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  port = 8083;
  name = getDirname _name;
  value = {
    services = {
      calibre-web = enabled // {
        openFirewall = true;
        listen.port = port;
      };
      caddy = mkCaddyProxy {
        domain = domains.${name};
        inherit port;
      };
    };
    systemd.services.calibre-web = {
      serviceConfig = {
        SupplementaryGroups = [ "syncthing" ];
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
