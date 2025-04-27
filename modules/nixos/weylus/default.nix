args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled;
  user = config.${namespace}.user.name;
  value = {
    programs.weylus = enabled // {
      users = [ user ];
      openFirewall = true;
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
