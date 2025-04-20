args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.displayManager.ly = enabled // {
      settings = {
        animation = "matrix";
        clear_password = true;
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
