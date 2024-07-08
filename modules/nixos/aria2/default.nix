{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enable enabled;
  user = config.${namespace}.user.name;
  value = {
    services.aria2 = enabled // enable [ "openPorts" ] // { rpcSecret = "P3TERX"; };
    users.users.${user}.extraGroups = [ "aria2" ];
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
