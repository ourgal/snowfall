args:
let
  inherit (args) namespace lib ;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    nix.monitored = enabled;
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
