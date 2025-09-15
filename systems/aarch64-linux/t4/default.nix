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
      router = enabled // {
        inherit lan;
        dhcp = enabled;
      };
      dnsmasq = enabled // {
        inherit lan;
        dns = enabled;
      };
      sops-nix = enabled // {
        router = enabled;
      };
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
