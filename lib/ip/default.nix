{ lib, ... }:
let
  inherit (lib.strings) fileContents;
  inherit (builtins) mapAttrs fromTOML map;
  lan = "192.168.123";
  lan6 = [ "fd5e:4f87:237" ];
  _ip = fromTOML (fileContents ./ip.key);
  ip = mapAttrs (_n: v: "${lan}.${toString v}") _ip;
  subnet = "${lan}.0/24";
in
{
  inherit
    ip
    lan
    lan6
    subnet
    ;
  subnet6 = map (v: "${v}::0/64") lan6;
  mac = fromTOML (fileContents ./mac.key);
  tailscale = {
    office2042 = "100.121.163.109";
    s20 = "100.83.72.86";
  };
}
