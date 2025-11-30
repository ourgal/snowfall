{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled enabledList getDirname;
  name = getDirname ./.;
in
{
  imports = [
    ./hardware-configuration.nix
    ./facter.nix
  ];

  dot = {
    user.host = name;
    boot.systemd = enabled;
    gpu.nvidia = enabled;
    autorandr.home = enabled;
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
    sops-nix = enabled // {
      desktops = enabled;
      ssh = enabled;
    };
    stylix = enabled;
  }
  // enabledList [
    # keep-sorted start
    "appimage"
    "audio"
    "avahi"
    "bandwhich"
    "bluetooth"
    "bpftune"
    "common"
    "desktop"
    "earlyoom"
    "envfs"
    "flatpak"
    "fonts"
    "fprintd"
    "geoclue2"
    "gpu-screen-recorder"
    "harmonia"
    "home-manager"
    "io-scheduler"
    "iotop"
    "kdiskmark"
    "kmonad"
    "logrotate"
    "nh"
    "nix-monitored"
    "nix-on-droid"
    "opentabletdriver"
    "power"
    "scrutiny"
    "syncthing"
    "temp-hosts"
    "tpm"
    "tuptime"
    "udev"
    "udisks2"
    "virtualbox"
    "weylus"
    # keep-sorted end
  ];

  system.stateVersion = "23.11";
}
