{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabledList;
in
{

  dot =
    {
      user.host = "n1";
    }
    // enabledList [
      # keep-sorted start
      "avahi"
      "iotop"
      "common"
      "nh"
      "tuptime"
      # keep-sorted end
    ];

  system.stateVersion = "25.05";
}
