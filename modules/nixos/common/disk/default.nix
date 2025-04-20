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
  _args = { inherit value args; };
in
nixosModule _args
