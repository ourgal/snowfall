args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    sops = {
      secrets = {
        "subs/nano" = { };
        "subs/knjc" = { };
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
