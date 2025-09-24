{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled;
in
{
  dot = {
    dev.nix = enabled;
  };
}
