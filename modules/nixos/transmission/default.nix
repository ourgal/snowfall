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
  value = {
    services = {
      transmission =
        enabled
        // enableOpt [
          "openPeerPorts"
          "openRPCPort"
        ]
        // {
          inherit user;
          webHome = pkgs.flood-for-transmission;
          downloadDirPermissions = "766";
          settings = {
            download-dir = "/home/${user}/mnt/nfs/anime/";
          };
          package = pkgs.transmission_4;
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
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
