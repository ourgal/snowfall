{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled enabledList getDirname;
  name = getDirname ./.;
in
{
  imports = [ ./hardware-configuration.nix ];

  dot =
    let
      lan = "end0";
    in
    {
      user.host = name;
      boot.extlinux = enabled;
      router = enabled // {
        inherit lan;
        dhcp = enabled;
      };
      dnsmasq = enabled // {
        inherit lan;
        dns = enabled;
        dhcp = enabled;
      };
    }
    // enabledList [
      # keep-sorted start
      "avahi"
      "common"
      "harmonia"
      "home-manager"
      "iotop"
      "nh"
      "tuptime"
      # keep-sorted end
    ];

  system.stateVersion = "25.05";
}
