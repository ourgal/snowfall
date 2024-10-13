{
  writeShellApplication,
  lib,
  viddy,
  transmission_4,
  pkgs,
  namespace,
}:
writeShellApplication rec {
  name = "anime";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [
    viddy
    transmission_4
    pkgs.${namespace}.tewi
  ];

  text = builtins.readFile ./anime.sh;
}
