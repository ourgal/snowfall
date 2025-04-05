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
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
