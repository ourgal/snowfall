args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace})
    nixosModule
    enabled
    domains
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  port = 8083;
  name = getDirname path;
  value = {
    services = {
      calibre-web = enabled // {
        openFirewall = true;
        listen.port = port;
      };
      caddy = mkCaddyProxy domains.${name} port;
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
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
