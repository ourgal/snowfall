{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled getDirname;
  name = getDirname ./.;
in
{
  imports = [ ./facter.nix ];

  dot = {
    user.host = name;
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
    home-manager = enabled;
  };

  system.stateVersion = "26.05";

}
