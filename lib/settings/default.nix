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
    "nixos-uefi-luks"
    "livecd"
    "livecd-arm"
    "livecd-ft2000"
    "q4ospc"
    "office1"
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
    "q4ospc"
  ];
  work = [
    "office2043"
    "office-laptop3"
    "q4ospc"
    "office1"
  ];
  windows = [ "nuc" ];
  non-NixOS = [
    "office2043"
    "office-laptop3"
    "q4ospc"
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
    userPassword = "$6$l/D9BaSzaYnuQBsG$DsGEmCOSrFc7ouT7KQoGPdesJyn88dfftTh8TP8k/8wvO4b50dCcaxZwls5dexllp3K8ri1mzyAxO/koMZrzt1";
    rootPassword = "$6$fQ9kPcLF.Ib8hmfa$8/NymO9CKitPafQfyKZRzvhAvTbHsviJZS5yKndVDzR3IKSNwb5lMhqmYo.7FgJXXjOUYVrUAC33ek8A2GtIW0";
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
      "earlyoom"
      "envfs"
      "fonts"
      "geoclue2"
      "gpu-screen-recorder"
      "harmonia"
      "home-manager"
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
      "tlp"
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
