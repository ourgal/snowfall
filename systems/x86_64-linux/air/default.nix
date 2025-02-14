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
      user.host = "air";
      boot.systemd = enabled;
      gpu.amd = enabled;
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
      "laptop"
      "location"
      "logrotate"
      "nfsMount"
      "nh"
      "pcscd"
      "power"
      "scrutiny"
      "sops-nix"
      "syncthing"
      "tpm"
      "tuptime"
      "udev"
      "udisks2"
      # keep-sorted end
    ];

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "24.05";
}
