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
      ipv4 = "192.168.100.1";
    in
    {
      user.host = name;
      boot.extlinux = enabled;
      router = enabled // {
        inherit lan;
        ipv4 = [ ipv4 ];
      };
      dnsmasq = enabled // {
        inherit lan;
        dns = enabled;
        dhcp = enabled // {
          gateway = ipv4;
          dns = ipv4;
        };
      };
      sing-box = enabled;
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
