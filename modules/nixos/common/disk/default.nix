args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services = {
      fstrim = enabled;
      autofs = enabled // {
        autoMaster = "/net -hosts --timeout=60";
      };
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
