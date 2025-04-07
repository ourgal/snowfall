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
    enableOpt
    domains
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  user = config.${namespace}.user.name;
  port = 9091;
  name = getDirname path;
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
      caddy = mkCaddyProxy domains.${name} port;
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
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
