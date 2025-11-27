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
    disko = enabled // {
      encrypt = enabled;
    };
    tuptime = enabled;
    avahi = enabled;
    usb-keyfile = enabled;
  };

  snowfallorg.users.${user}.home = disabled;

  system.stateVersion = "25.05";
}
