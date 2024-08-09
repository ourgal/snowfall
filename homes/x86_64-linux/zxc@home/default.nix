{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled;
in
{
  dot = {
    awesome.minimal = enabled;
    fonts = enabled;
    cli = enabled;
    desktop = enabled // {
      editor = enabled;
    };
    dev = enabled;
  };
}
