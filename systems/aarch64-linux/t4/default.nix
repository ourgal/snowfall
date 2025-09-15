{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled enabledList;
in
{
  imports = [ ./hardware-configuration.nix ];

  dot =
    {
      user.host = "t4";
      boot.extlinux = enabled;
    }
    // enabledList [
      # keep-sorted start
      "avahi"
      "common"
      "iotop"
      "harmonia"
      "nh"
      "home-manager"
      "tuptime"
      # keep-sorted end
    ];

  system.stateVersion = "25.05";
}
