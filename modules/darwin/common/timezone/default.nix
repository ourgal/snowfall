args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    time.timeZone = lib.mkDefault "Asia/Taipei";
  };
  _args = { inherit value args; };
in
nixosModule _args
