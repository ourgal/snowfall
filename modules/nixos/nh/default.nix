args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled;
  user = config.${namespace}.user.name;
  value = {
    programs.nh = enabled // {
      flake = "/home/${user}/workspace/snowfall";
      clean = enabled // {
        dates = "weekly";
        extraArgs = "--keep 5 --keep-since 3d";
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
