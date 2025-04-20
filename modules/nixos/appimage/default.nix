args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled enableOpt;
  value = {
    programs.appimage = enabled // enableOpt [ "binfmt" ];
  };
  _args = { inherit value args; };
in
nixosModule _args
