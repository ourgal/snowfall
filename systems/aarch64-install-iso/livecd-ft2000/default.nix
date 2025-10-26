{
  lib,
  namespace,
  config,
  pkgs,
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

  boot = {
    kernelPackages = pkgs.linuxPackagesFor (pkgs.callPackage ./kernel { });
  };

  system.stateVersion = config.system.nixos.release;
}
