args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled enableOpt;
  value = {
    programs.fuse.userAllowOther = true;
    services.udisks2 = enabled // enableOpt [ "mountOnMedia" ];
  };
  _args = { inherit value args; };
in
nixosModule _args
