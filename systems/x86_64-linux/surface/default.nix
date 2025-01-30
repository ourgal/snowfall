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
  dot =
    {
      user.host = "surface";
      boot.systemd = enabled;
      gpu.intel = enabled;
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
      "disko"
      "envfs"
      "fonts"
      "gpu-screen-recorder"
      "harmonia"
      "input"
      "kmonad"
      "laptop"
      "location"
      "logrotate"
      "nh"
      "pcscd"
      "power"
      "sops-nix"
      "syncthing"
      "tpm"
      "tuptime"
      "udev"
      "udisks2"
      # keep-sorted end
    ];

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "23.11";
}
