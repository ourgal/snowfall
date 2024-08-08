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
  dot =
    {
      user.host = "air";
      boot.systemd = enabled;
      gpu.amd = enabled;
      firewall = enabledList [
        "aria2"
        "barrier"
        "dufs"
        "harmonia"
        "kdeconnect"
        "mdns"
        "roc"
        "scream"
        "syncthing"
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
      "disko"
      "fonts"
      "harmonia"
      "kmonad"
      "laptop"
      "location"
      "logrotate"
      "nh"
      "power"
      "tpm"
      "udisks2"
    ];

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "24.05";
}
