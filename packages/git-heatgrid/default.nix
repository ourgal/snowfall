{
  writeShellApplication,
  lib,
  _sources',
}:
writeShellApplication rec {
  inherit (_sources' ./.) pname version src;

  meta = {
    mainProgram = pname;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = builtins.readFile (src + /git-heatgrid);
}
