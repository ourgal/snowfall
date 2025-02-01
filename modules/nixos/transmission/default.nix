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
    ;
  user = config.${namespace}.user.name;
  port = 9091;
  dataDir = "/var/lib/transmission";
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
      caddy = enabled // {
        virtualHosts = {
          "http://${domains.transmission}".extraConfig = ''
            reverse_proxy http://localhost:${toString port}
          '';
        };
      };
    };
    users.users.${user}.extraGroups = [ "transmission" ];
    systemd.tmpfiles.rules = [
      "e ${dataDir} 2770 - - - -"
      "e ${dataDir}/Downloads 2770 - - - -"
    ];
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
