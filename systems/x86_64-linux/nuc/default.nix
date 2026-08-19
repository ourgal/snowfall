{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled enabledList getDirname;
  name = getDirname ./.;
in
{
  imports = [
    ./hardware-configuration.nix
    ./facter.nix
  ];

  dot = {
    user.host = name;
    boot.grub.dual_boot = enabled;
    sops-nix = enabled // {
      ssh = enabled;
    };
  }
  // enabledList [
    # keep-sorted start
    "audio"
    "avahi"
    "bpftune"
    "common"
    "desktop"
    "earlyoom"
    "envfs"
    "home-manager"
    "logrotate"
    "nh"
    "pcscd"
    "tuptime"
    # keep-sorted end
  ];

  system.stateVersion = "26.05";
}
