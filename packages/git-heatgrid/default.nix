{
  writeShellApplication,
  lib,
  _sources',
}:
let
  source = _sources' ./.;
in
writeShellApplication rec {
  name = source.pname;

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = builtins.readFile (source.src + /git-heatgrid);
}
