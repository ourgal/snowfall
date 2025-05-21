args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled settings;
  inherit (config.${namespace}.user) host;
  value = {
    services.chrony = enabled // {
      servers = config.networking.timeServers;
      serverOption = if builtins.elem host settings.desktops then "offline" else "iburst";
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
