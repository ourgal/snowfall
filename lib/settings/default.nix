{ lib, ... }:
let
  allHosts = [
    "air"
    "brix"
    "home"
    "surface"
    "d2550"
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
  windows = [ "nuc" ];
  servers = {
    anki-sync-server = [ "brix" ];
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
      windows
      ;
    hostType = lib.types.enum allHosts;
  };
  homeSpecialArgs =
    hosts: args: builtins.foldl' (acc: v: acc // { "zxc@${v}".specialArgs = args; }) { } hosts;
}
