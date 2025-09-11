{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled;
in
{
  dot = {
    cli = enabled;
    dev.nix = enabled;
  };
}
