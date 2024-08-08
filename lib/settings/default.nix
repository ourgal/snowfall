{ lib, ... }:
let
  allHosts = [
    "air"
    "brix"
    "home"
    "nuc"
    "surface"
    "tower"
  ];
  laptops = [
    "air"
    "surface"
  ];
  desktops = [
    "air"
    "home"
    "surface"
  ];
in
{
  settings = {
    inherit allHosts laptops desktops;
    hostType = lib.types.enum allHosts;
  };
  homeSpecialArgs =
    hosts: args: builtins.foldl' (acc: v: acc // { "zxc@${v}".specialArgs = args; }) { } hosts;
}
