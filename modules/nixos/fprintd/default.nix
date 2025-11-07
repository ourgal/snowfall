args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.fprintd = enabled // {
      tod = enabled // {
        driver = pkgs.${namespace}.libfprint-2-tod1-synatudor;
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
