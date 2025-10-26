{
  lib,
  namespace,
  config,
  ...
}:
let
  inherit (lib.${namespace}) getDirname;
  name = getDirname ./.;
in
{
  dot = {
    user.host = name;
  };

  system.stateVersion = config.system.nixos.release;
}
