{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled;
in
{
  dot = {
    awesome.minimalFnl = enabled;
    cli = enabled;
    dev.nix = enabled;
    fonts = enabled;
    desktop = enabled // {
      editor = enabled;
    };
  };
}
