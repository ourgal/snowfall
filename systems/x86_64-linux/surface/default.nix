{
  lib,
  namespace,
  config,
  ...
}:
let
  inherit (lib.${namespace}) enabled disabled settings;
  user = config.${namespace}.user.name;
in
{
  dot = {
    user.host = "surface";
    boot.systemd = enabled;
    gpu.intel = enabled;
    firewall.disable = enabled;
    disko = enabled;
  } // settings.laptopModule;

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "23.11";
}
