{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabledList getDirname enabled;
  name = getDirname ./.;
in
{

  dot = {
    user.host = name;
    boot.grub.nodev = enabled;
  }
  // enabledList [
    # keep-sorted start
    "avahi"
    "common"
    "disko"
    "iotop"
    "nh"
    "tuptime"
    # keep-sorted end
  ];

  boot.kernelParams = [ "console=tty" ];

  system.stateVersion = "25.05";
}
