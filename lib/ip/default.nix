{ lib, ... }:
let
  inherit (lib.strings) fileContents;
  inherit (builtins) mapAttrs fromTOML;
  lan = "192.168.123";
  _ip = fromTOML (fileContents ./ip.key);
  ip = mapAttrs (_n: v: "${lan}.${toString v}") _ip;
  subnet = "${lan}.0/24";
in
{
  inherit ip lan subnet;
  mac = fromTOML (fileContents ./mac.key);
}
