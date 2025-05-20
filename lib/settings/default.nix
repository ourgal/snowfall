{ lib, namespace, ... }:
let
  inherit (builtins) foldl';
  allHosts = [
    "air"
    "brix"
    "home"
    "surface"
    "router"
    "yanyu"
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
      "bpftune"
      "common"
      "desktop"
      "envfs"
      "fonts"
      "geoclue2"
      "gpu-screen-recorder"
      "harmonia"
      "input"
      "iotop"
      "laptop"
      "logrotate"
      "nh"
      "pcscd"
      "power"
      "scrutiny"
      "sops-nix"
      "syncthing"
      "systemd-resolved"
      "tpm"
      "tuptime"
      "udev"
      "udisks2"
      # keep-sorted end
    ];
  };
  homeSpecialArgs = hosts: args: foldl' (acc: v: acc // { "zxc@${v}".specialArgs = args; }) { } hosts;
}
