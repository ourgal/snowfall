{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled;
in
{
  dot = {
    fonts = enabled;
    cli = enabled;
  };
}
