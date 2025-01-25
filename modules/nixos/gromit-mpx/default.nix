args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    servs.gromit-mpx = enabled;
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
