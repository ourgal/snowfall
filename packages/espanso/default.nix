{
  writeShellApplication,
  lib,
  espanso,
  espanso-wayland,
  ...
}:
writeShellApplication rec {
  name = "espanso";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [ ];

  text = # bash
    ''
      if test -z "''${WAYLAND_DISPLAY:-""}" ; then
        ${lib.getExe espanso} "$@"
      else
        ${lib.getExe espanso-wayland} "$@"
      fi
    '';
}
