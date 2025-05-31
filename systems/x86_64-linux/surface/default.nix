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
    firewall = {
      aria2 = enabled;
      barrier = enabled;
      docker = enabled;
      dufs = enabled;
      kdeconnect = enabled;
      mdns = enabled;
      roc = enabled;
      scream = enabled;
      syncthing = enabled;
      transmission = enabled;
      disable = enabled;
    };
    disko = enabled;
    sops-nix = enabled // {
      desktops = enabled;
    };
  } // settings.laptopModules;

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "23.11";
}
