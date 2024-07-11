{
  lib,
  namespace,
  config,
  ...
}:
let
  inherit (lib.${namespace}) enabled disabled enabledList;
  user = (config.${namespace}.user).name;
in
{
  imports = [ ./hardware-configuration.nix ];

  dot =
    {
      user.host = "home";
      boot.systemd = enabled;
      gpu.nvidia = enabled;
      firewall = enabledList [
        "aria2"
        "barrier"
        "dufs"
        "harmonia"
        "kdeconnect"
        "mdns"
        "roc"
        "scream"
        "transmission"
      ];
    }
    // enabledList [
      "adb"
      "appimage"
      "audio"
      "bluetooth"
      "common"
      "desktop"
      "fonts"
      "harmonia"
      "kmonad"
      "location"
      "logrotate"
      "nfsMount"
      "nh"
      "power"
      "tpm"
      "udisks2"
    ];

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "23.11";
}
