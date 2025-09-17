args:
let
  inherit (args)
    namespace
    lib
    config
    pkgs
    ;
  inherit (lib.${namespace}) nixosModule enabled;
  user = config.${namespace}.user.name;
  value = {
    hardware.sane = enabled;
    users.users.${user}.extraGroups = [ "scanner" ];
    environment.systemPackages = [ pkgs.xsane ];
  };
  _args = { inherit value args; };
in
nixosModule _args
