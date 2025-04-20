args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled;
  user = config.${namespace}.user.name;
  value = {
    services.peerflix = enabled // {
      downloadDir = "/home/${user}/Downloads/peerflix";
    };
    users.users.${user}.extraGroups = [ "peerflix" ];
  };
  _args = { inherit value args; };
in
nixosModule _args
