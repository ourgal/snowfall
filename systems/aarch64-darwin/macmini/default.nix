{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) getDirname enabled;
  name = getDirname ./.;
in
{

  dot = {
    user.host = name;
    common = enabled;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
