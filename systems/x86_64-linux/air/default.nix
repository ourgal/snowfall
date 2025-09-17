{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled settings getDirname;
  name = getDirname ./.;
in
{
  dot = {
    user.host = name;
    boot.systemd = enabled;
    gpu.amd = enabled;
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
      ssh = enabled;
    };
    nix-monitored = enabled;
    nix-on-droid = enabled;
  } // settings.laptopModules;

  system.stateVersion = "24.05";
}
