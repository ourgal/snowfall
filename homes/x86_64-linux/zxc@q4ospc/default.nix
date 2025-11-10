{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled;
in
{
  dot = {
    awesome.minimalFnl = enabled;
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
      zip = enabled;
    };
  };
}
