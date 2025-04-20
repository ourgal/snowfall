args:
let
  inherit (args)
    namespace
    lib
    config
    pkgs
    _name
    ;
  inherit (lib.${namespace})
    nixosModule
    enabled
    enableOpt
    domains
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  user = config.${namespace}.user.name;
  port = 9091;
  name = getDirname _name;
  dataDir = "/var/lib/${name}";
  value = {
    services = {
      transmission =
        enabled
        // enableOpt [
          "openPeerPorts"
          "openRPCPort"
        ]
        // {
          webHome = pkgs.flood-for-transmission;
          package = pkgs.transmission_4;
          settings = {
            download-dir = "${dataDir}/Downloads";
            rpc-whitelist-enabled = false;
            rpc-host-whitelist-enabled = false;
            ratio-limit = 0;
            ratio-limit-enabled = true;
          };
        };
      caddy = mkCaddyProxy {
        domain = domains.${name};
        inherit port;
      };
    };
    users.users.${user}.extraGroups = [ name ];
    systemd.tmpfiles.rules = [
      "e ${dataDir} 0770 - - - -"
      "e ${dataDir}/Downloads 0770 - - - -"
    ];
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = port;
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
