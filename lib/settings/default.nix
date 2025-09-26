{ lib, namespace, ... }:
let
  inherit (builtins) foldl';
  allHosts = [
    "air"
    "brix"
    "home"
    "office2043"
    "office-laptop3"
    "surface"
    "router"
    "yanyu"
    "n1"
    "t4"
    "macmini"
    "nixos-mbr"
    "nixos-uefi"
  ];
  laptops = [
    "air"
    "surface"
    "office-laptop3"
  ];
  desktops = [
    "air"
    "home"
    "surface"
    "office2043"
    "macmini"
  ];
  work = [
    "office2043"
    "office-laptop3"
  ];
  windows = [ "nuc" ];
  non-NixOS = [
    "office2043"
    "office-laptop3"
    "macmini"
  ];
  non-HomeManager = [
    "brix"
    "router"
    "yanyu"
    "n1"
  ];
  homeManager = foldl' (
    acc: v: lib.lists.remove v acc
  ) lib.${namespace}.settings.allHosts lib.${namespace}.settings.non-HomeManager;
  nixOS = foldl' (
    acc: v: lib.lists.remove v acc
  ) lib.${namespace}.settings.allHosts lib.${namespace}.settings.non-NixOS;
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
      work
      non-NixOS
      nixOS
      non-HomeManager
      homeManager
      ;
    hostType = lib.types.enum allHosts;
    laptopModules = lib.${namespace}.enabledList [
      # keep-sorted start
      "appimage"
      "audio"
      "avahi"
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
      "tlp"
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
  homeSpecialArgs = hosts: args: foldl' (acc: v: acc // { "zxc@${v}".specialArgs = args; }) { } hosts;

  systemSpecialArgs = hosts: args: foldl' (acc: v: acc // { "${v}".specialArgs = args; }) { } hosts;
}
