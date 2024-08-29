{ ... }@args:
let
  inherit (args)
    namespace
    lib
    config
    pkgs
    ;
  inherit (lib.${namespace}) nixosModule enabled enableOpt;
  user = config.${namespace}.user.name;
  value = {
    services.transmission =
      enabled
      // enableOpt [
        "openPeerPorts"
        "openRPCPort"
      ]
      // {
        webHome = pkgs.flood-for-transmission;
        downloadDirPermissions = "770";
        settings = {
          download-dir = "/home/${user}/Downloads/transmission/";
        };
        package = pkgs.transmission_4;
      };
    users.users.${user}.extraGroups = [ "transmission" ];
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
