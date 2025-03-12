{ lib, namespace, ... }:
let
  allHosts = [
    "air"
    "brix"
    "home"
    "surface"
    "d2550"
    "nixos-mbr"
    "nixos-uefi"
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
    laptopModules = lib.${namespace}.enabledList [
      # keep-sorted start
      "appimage"
      "audio"
      "bandwhich"
      "bluetooth"
      "common"
      "desktop"
      "envfs"
      "fonts"
      "gpu-screen-recorder"
      "harmonia"
      "input"
      "kmonad"
      "laptop"
      "location"
      "logrotate"
      "nh"
      "pcscd"
      "power"
      "scrutiny"
      "sops-nix"
      "syncthing"
      "tpm"
      "tuptime"
      "udev"
      "udisks2"
      # keep-sorted end
    ];
  };
  homeSpecialArgs =
    hosts: args: builtins.foldl' (acc: v: acc // { "zxc@${v}".specialArgs = args; }) { } hosts;
}
