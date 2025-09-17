{
  lib,
  namespace,
  config,
  ...
}:
let
  inherit (lib.${namespace}) enabled disabled getDirname;
  user = config.${namespace}.user.name;
  name = getDirname ./.;
in
{

  dot = {
    user.host = name;
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
