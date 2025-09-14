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
      user.host = "n1";
      common = {
        # disable systemd boot
        defaultPackages = enabled;
        disk = enabled;
        i18n = enabled;
        localBin = enabled;
        network = enabled;
        ntp = enabled;
        log = enabled;
        nix = enabled;
        user = enabled;
        ssh = enabled;
        timezone = enabled;
        zram = enabled;
      };
    }
    // enabledList [
      # keep-sorted start
      "avahi"
      "iotop"
      "nh"
      "tuptime"
      # keep-sorted end
    ];

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "25.05";

  home-manager.extraSpecialArgs = lib.${namespace}.SpecialArgs;
}
