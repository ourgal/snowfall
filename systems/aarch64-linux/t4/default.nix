{
  lib,
  namespace,
  config,
  ...
}:
let
  inherit (lib.${namespace}) enabled enabledList;
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
      "harmonia"
      "nh"
      "tuptime"
      # keep-sorted end
    ];

  snowfallorg.users.${user}.home = enabled;

  system.stateVersion = "25.05";

  home-manager.extraSpecialArgs = lib.${namespace}.SpecialArgs;
}
