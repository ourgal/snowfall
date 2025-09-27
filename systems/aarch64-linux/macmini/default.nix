{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabledList getDirname enabled;
  name = getDirname ./.;
in
{
  imports = [
    ./hardware-configuration.nix
    ./apple-silicon-support
  ];

  dot =
    {
      user.host = name;
      boot.systemd = enabled;
    }
    // enabledList [
      # keep-sorted start
      "avahi"
      "iotop"
      "common"
      "nh"
      "tuptime"
      "home-manager"
      "harmonia"
      # keep-sorted end
    ];

  system.stateVersion = "25.05";
}
