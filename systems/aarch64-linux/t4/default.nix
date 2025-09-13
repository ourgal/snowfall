{
  lib,
  namespace,
  config,
  inputs,
  ...
}:
let
  inherit (lib.${namespace}) enabled enabledList;
  user = config.${namespace}.user.name;
in
{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.friendlyarm-nanopc-t4
  ];

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

  snowfallorg.users.${user}.home = enabled;

  system.stateVersion = "25.05";

  home-manager.extraSpecialArgs = lib.${namespace}.SpecialArgs;
}
