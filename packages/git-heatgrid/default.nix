{
  writeShellApplication,
  lib,
  fetchFromGitHub,
  namespace,
}:
let
  name = "git-heatgrid";
  inherit (lib.${namespace}.sources.${name}) src;
in
writeShellApplication rec {
  inherit name;

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = builtins.readFile (
    fetchFromGitHub {
      inherit (src)
        owner
        repo
        rev
        sha256
        ;
    }
    + /git-heatgrid
  );
}
