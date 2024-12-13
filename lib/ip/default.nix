{ lib, ... }:
let
  lan = "192.168.123";
  _ip = {
    brix = "206";
    home = "100";
    router = "1";
  };
  ip = lib.attrsets.mapAttrs (_n: v: "${lan}.${v}") _ip;
in
{
  inherit ip;
}
