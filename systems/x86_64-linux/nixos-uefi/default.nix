{
  lib,
  namespace,
  config,
  ...
}:
let
  inherit (lib.${namespace}) enabled disabled;
  user = config.${namespace}.user.name;
in
{

  dot = {
    user.host = "nixos-uefi";
    boot.systemd = enabled;
    common = enabled;
    nh = enabled;
    disko = enabled;
    tuptime = enabled;
    avahi = enabled;
  };

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "24.11";
}
