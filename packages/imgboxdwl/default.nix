{
  writeShellApplication,
  lib,
  curl,
  aria2,
  python3,
}:
writeShellApplication rec {
  name = "imgboxdwl";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [
    curl
    aria2
    python3.pkgs.tqdm
  ];

  text = builtins.readFile ./imgboxdwl.sh;
}
