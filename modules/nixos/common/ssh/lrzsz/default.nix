args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule;
  value = {
    environment.systemPackages = [ pkgs.lrzsz ];
  };
  _args = { inherit value args; };
in
nixosModule _args
