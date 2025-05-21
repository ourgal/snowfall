{
  lib,
  namespace,
  config,
  ...
}:
let
  inherit (lib.${namespace}) enabled disabled enabledList;
  user = config.${namespace}.user.name;
in
{

  dot =
    {
      user.host = "yanyu";
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

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "24.11";
}
