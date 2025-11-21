{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabledList getDirname enabled;
  name = getDirname ./.;
in
{

  dot =
    {
      user.host = name;
      boot.grub = enabled;
    }
    // enabledList [
      # keep-sorted start
      "avahi"
      "iotop"
      "common"
      "nh"
      "disko"
      "tuptime"
      # keep-sorted end
    ];

  boot.kernelParams = [ "console=tty" ];

  system.stateVersion = "25.05";
}
