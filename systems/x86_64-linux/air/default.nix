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
        # keep-sorted start
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
        # keep-sorted end
      ];
    }
    // enabledList [
      # keep-sorted start
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
      "sops-nix"
      "syncthing"
      "tpm"
      "udisks2"
      # keep-sorted end
    ];

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "24.05";
}
