{
  writeShellApplication,
  lib,
  xsel,
  ...
}:
writeShellApplication rec {
  name = "cin";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [ ];

  text = # bash
    ''
      ${lib.getExe xsel} --input --clipboard "$@"
    '';
}
