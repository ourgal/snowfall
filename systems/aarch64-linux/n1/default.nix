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
    "common"
    "iotop"
    "nh"
    "tuptime"
    # keep-sorted end
  ];

  system.stateVersion = lib.mkForce "25.05";
}
