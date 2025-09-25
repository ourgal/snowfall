args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) darwinModule;
  value = {
    time.timeZone = lib.mkDefault "Asia/Taipei";
  };
  _args = { inherit value args; };
in
darwinModule _args
