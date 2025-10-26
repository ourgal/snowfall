{
  lib,
  pkgs,
  fetchurl,
  linuxManualConfig,
  ...
}:
let
  version = "6.16.12";
  read-linux-config = pkgs.callPackage ./read-linux-config.nix { };
in
(linuxManualConfig {
  inherit version;
  modDirVersion = "${version}-raven";

  src = fetchurl {
    url = "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${version}.tar.xz";
    sha256 = "sha256-fKTevFypEuu4p2lEpcEYr9XQnjHvQ8SUrbFCc9opom4=";
  };

  extraMakeFlags = [ "V=2" ];

  kernelPatches =
    let
      patchFiles = lib.filesystem.listFilesRecursive ./patches;
      makePatch = file: {
        name = lib.removePrefix (toString ./patches + "/") (toString file);
        patch = file;
      };
    in
    map makePatch patchFiles;

  configfile = ./config;
  config = read-linux-config ./config;
})
