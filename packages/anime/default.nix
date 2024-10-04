{
  writeShellApplication,
  lib,
  viddy,
  transmission_4,
  ...
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
  ];

  text = builtins.readFile ./anime.sh;
}
