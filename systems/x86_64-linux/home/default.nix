{
  lib,
  namespace,
  _name,
  ...
}:
let
  inherit (lib.${namespace}) enabled enabledList getDirname;
  name = getDirname ./.;
in
{
  imports = [ ./hardware-configuration.nix ];

  dot =
    {
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
      "envfs"
      "flatpak"
      "fonts"
      "geoclue2"
      "gpu-screen-recorder"
      "harmonia"
      "iotop"
      "kmonad"
      "logrotate"
      "nfsMount"
      "nh"
      "nix-monitored"
      "nix-on-droid"
      "opentabletdriver"
      "pcscd"
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
