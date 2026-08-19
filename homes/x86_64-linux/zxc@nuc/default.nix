{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled;
in
{
  dot = {
    awesome.minimalFnl = enabled;
    fonts = enabled;
    cli = enabled;
    desktop = enabled // {
      editor = enabled;
    };
    stylix = enabled;
  };
}
