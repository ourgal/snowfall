args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled;
  inherit (config.${namespace}.user) host;
  value = {
    boot.loader.systemd-boot = enabled;
    boot.loader.efi.canTouchEfiVariables = if host == "macmini" then false else true;
  };
  _args = { inherit value args; };
in
nixosModule _args
