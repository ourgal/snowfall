{ writeShellApplication, lib, ... }:
writeShellApplication rec {
  name = "udiskie-sops-nix";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [ ];

  text = builtins.readFile ./udiskie-sops-nix.sh;
}
