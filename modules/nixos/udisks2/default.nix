args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled enableOpt;
  value = {
    programs.fuse.userAllowOther = true;
    services.udisks2 = enabled // enableOpt [ "mountOnMedia" ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
