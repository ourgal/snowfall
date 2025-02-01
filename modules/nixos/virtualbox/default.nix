args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled;
  user = config.${namespace}.user.name;
  value = {
    virtualisation.virtualbox.host = enabled // {
      headless = true;
    };
    users.users.${user}.extraGroups = [ "vboxusers" ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
