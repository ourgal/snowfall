args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.bpftune = enabled;
  };
  _args = { inherit value args; };
in
nixosModule _args
