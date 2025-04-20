args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.tuptime = enabled;
    environment.systemPackages = [ pkgs.tuptime ];
  };
  _args = { inherit value args; };
in
nixosModule _args
