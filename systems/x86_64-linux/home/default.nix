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
      autorandr.home = enabled;
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
        # keep-sorted end
      ];
    }
    // enabledList [
      # keep-sorted start
      "adb"
      "appimage"
      "audio"
      "bandwhich"
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
      "sops-nix"
      "syncthing"
      "tpm"
      "transmission"
      "udisks2"
      # keep-sorted end
    ];

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "23.11";
}
