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
    }
    // enabledList [
      # keep-sorted start
      "appimage"
      "audio"
      "bandwhich"
      "bluetooth"
      "common"
      "desktop"
      "envfs"
      "flatpak"
      "fonts"
      "gpu-screen-recorder"
      "harmonia"
      "kmonad"
      "location"
      "logrotate"
      "nfsMount"
      "nh"
      "pcscd"
      "power"
      "scrutiny"
      "sops-nix"
      "syncthing"
      "temp-hosts"
      "tpm"
      "tuptime"
      "udev"
      "udisks2"
      "virtualbox"
      # keep-sorted end
    ];

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "23.11";
}
