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
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
