args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule;
  value = {
    environment.systemPackages = [ pkgs.kdiskmark ]; # It only works in system packages
  };
  _args = { inherit value args; };
in
nixosModule _args
