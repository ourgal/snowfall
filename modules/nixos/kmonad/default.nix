{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled;
  user = config.${namespace}.user.name;
  value = {
    users.users.${user} = {
      extraGroups = [
        "input"
        "uinput"
      ]; # Enable ‘sudo’ for the user.
    };
    hardware.uinput = enabled;
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
