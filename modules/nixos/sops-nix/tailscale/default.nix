args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    sops = {
      secrets = {
        "tailscale/authKey" = { };
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
