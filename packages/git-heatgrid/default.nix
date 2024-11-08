{
  writeShellApplication,
  lib,
  _sources,
}:
let
  inherit (_sources.git-heatgrid) src;
  name = _sources.git-heatgrid.pname;
in
writeShellApplication rec {
  inherit name;

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = builtins.readFile (src + /git-heatgrid);
}
