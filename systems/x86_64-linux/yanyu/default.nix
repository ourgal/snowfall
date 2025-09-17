{ lib, namespace, ... }:
let
  inherit (lib.${namespace})
    enabled
    disabled
    enabledList
    getDirname
    ;
  name = getDirname ./.;
in
{

  dot =
    {
      user.host = name;
      boot.systemd = enabled;
      firewall = {
        docker = enabled;
        mdns = enabled;
      };
    }
    // enabledList [
      # keep-sorted start
      "avahi"
      "common"
      "disko"
      "firehol"
      "iotop"
      "nh"
      "restic-server"
      "tuptime"
      # keep-sorted end
    ];

  # A start job is running for /dev/tpmrm0
  systemd.tpm2 = disabled;
  boot.initrd.systemd.tpm2 = disabled;

  system.stateVersion = "24.11";
}
