args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.tuptime = enabled;
    environment.systemPackages = [ pkgs.tuptime ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
