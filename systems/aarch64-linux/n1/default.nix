{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabledList getDirname;
  name = getDirname ./.;
in
{

  dot = {
    user.host = name;
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
