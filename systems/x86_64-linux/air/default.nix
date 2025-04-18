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
    user.host = "air";
    boot.systemd = enabled;
    gpu.amd = enabled;
    firewall.disable = enabled;
    disko = enabled;
    sops-nix = enabled // {
      desktops = enabled;
      ssh = enabled;
    };
    nix-monitored = enabled;
  } // settings.laptopModules;

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "24.05";
}
