args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) darwinModule enabled;
  value = {
    services.openssh = enabled;
    environment.systemPackages = [ pkgs.${namespace}.trzsz-go ];
  };
  _args = { inherit value args; };
in
darwinModule _args
