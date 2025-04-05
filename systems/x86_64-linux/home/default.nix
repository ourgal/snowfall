{
  lib,
  namespace,
  config,
  ...
}:
let
  inherit (lib.${namespace}) enabled disabled enabledList;
  user = config.${namespace}.user.name;
in
{
  imports = [ ./hardware-configuration.nix ];

  dot =
    {
      user.host = "home";
      boot.systemd = enabled;
      gpu.nvidia = enabled;
      autorandr.home = enabled;
      firewall.disable = enabled;
      sops-nix = enabled // {
        desktops = enabled;
        ssh = enabled;
      };
    }
    // enabledList [
      # keep-sorted start
      "appimage"
      "audio"
      "bandwhich"
      "bluetooth"
      "bpftune"
      "common"
      "desktop"
      "envfs"
      "flatpak"
      "gpu-screen-recorder"
      "fonts"
      "harmonia"
      "kmonad"
      "location"
      "logrotate"
      "nfsMount"
      "nh"
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
      "nix-monitored"
      # keep-sorted end
    ];

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "23.11";
}
