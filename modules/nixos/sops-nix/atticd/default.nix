args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    sops = {
      secrets = {
        "atticd/token" = { };
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
