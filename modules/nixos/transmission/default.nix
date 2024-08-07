{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled enable;
  user = config.${namespace}.user.name;
  value = {
    services.transmission =
      enabled
      // enable [
        "openPeerPorts"
        "openRPCPort"
      ]
      // {
        # webHome = pkgs.flood-for-transmission;
        downloadDirPermissions = "770";
        settings = {
          download-dir = "/home/${user}/Downloads/transmission/";
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
