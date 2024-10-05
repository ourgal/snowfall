{
  writeShellApplication,
  lib,
  nix-search-cli,
}:
writeShellApplication rec {
  name = "nix-searchc";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [ nix-search-cli ];

  text = builtins.readFile ./nix-searchc.sh;
}
