{
  writeShellApplication,
  lib,
  curl,
  aria2,
  python3Packages,
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
    python3Packages.tqdm
  ];

  text = builtins.readFile ./imgboxdwl.sh;
}
