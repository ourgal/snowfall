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
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
