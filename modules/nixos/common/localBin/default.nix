args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    environment.localBinInPath = true;
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
