{ ... }@args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled enable;
  value = {
    programs.appimage = enabled // enable [ "binfmt" ];
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
