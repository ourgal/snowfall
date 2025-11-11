{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled;
in
{
  dot = {
    fonts = enabled;
    cli = {
      versionControl = enabled;
      nix = enabled;
      clipboard = enabled;
      download = enabled;
      editor = enabled;
      file-manager = enabled;
      multiplexer = enabled;
      shell = enabled;
      ssh = enabled;
      zip = enabled;
    };
    desktop = {
      browser = enabled;
    };
    dev.nix = enabled;
  };
}
