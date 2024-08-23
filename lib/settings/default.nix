{ lib, ... }:
let
  allHosts = [
    "air"
    "brix"
    "home"
    "surface"
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
  servers = {
    syncthing = [ "brix" ];
  };
in
{
  settings = {
    inherit
      allHosts
      laptops
      desktops
      servers
      ;
    hostType = lib.types.enum allHosts;
  };
  homeSpecialArgs =
    hosts: args: builtins.foldl' (acc: v: acc // { "zxc@${v}".specialArgs = args; }) { } hosts;
}
