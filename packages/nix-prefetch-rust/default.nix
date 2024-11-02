{
  writeShellApplication,
  lib,
  nix-prefetch,
  xclip,
  ...
}:
writeShellApplication rec {
  name = "nix-prefetch-rust";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [
    nix-prefetch
    xclip
  ];

  text = builtins.readFile ./main.sh;
}
