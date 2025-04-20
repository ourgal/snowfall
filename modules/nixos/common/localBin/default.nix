args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    environment.localBinInPath = true;
  };
  _args = { inherit value args; };
in
nixosModule _args
