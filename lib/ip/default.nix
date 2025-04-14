{ lib, ... }:
let
  inherit (lib.strings) fileContents;
  inherit (builtins) mapAttrs;
  lan = "192.168.123";
  _ip = rec {
    brix = fileContents ./brix_ip.key;
    home = fileContents ./home_ip.key;
    onecloud = fileContents ./onecloud_ip.key;
    d2550 = fileContents ./d2550_ip.key;
    nuc = fileContents ./nuc_ip.key;
    ct3003 = fileContents ./ct3003_ip.key;
    yanyu = fileContents ./yanyu_ip.key;
    router = d2550;
  };
  ip = mapAttrs (_n: v: "${lan}.${v}") _ip;
  subnet = "${lan}.0/24";
in
{
  inherit ip lan subnet;
  mac = {
    brix = fileContents ./brix_mac.key;
    home = fileContents ./home_mac.key;
    onecloud = fileContents ./onecloud_mac.key;
    nuc = fileContents ./nuc_mac.key;
    ct3003 = fileContents ./ct3003_mac.key;
    yanyu = fileContents ./yanyu_mac.key;
  };
}
