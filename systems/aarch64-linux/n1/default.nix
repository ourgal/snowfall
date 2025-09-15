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

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "25.05";

  home-manager.extraSpecialArgs = lib.${namespace}.SpecialArgs;
}
