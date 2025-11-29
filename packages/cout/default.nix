{
  writeShellApplication,
  lib,
  xsel,
  ...
}:
writeShellApplication rec {
  name = "cout";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [ ];

  text = # bash
    ''
      ${lib.getExe xsel} --output --clipboard "$@"
    '';
}
