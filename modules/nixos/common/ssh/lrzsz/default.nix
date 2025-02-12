args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule;
  value = {
    environment.systemPackages = [ pkgs.lrzsz ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
