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
  imports = [ ./hardware-configuration.nix ];

  dot =
    {
      user.host = "t4";
      boot.extlinux = enabled;
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

  # A start job is running for /dev/tpmrm0
  systemd.tpm2 = disabled;
  boot.initrd.systemd.tpm2 = disabled;

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "25.05";
}
