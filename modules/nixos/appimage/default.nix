args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled enableOpt;
  value = {
    programs.appimage = enabled // enableOpt [ "binfmt" ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
