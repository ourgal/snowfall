{
  writeShellApplication,
  lib,
  pkgs,
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
        ${pkgs.espanso}/bin/espanso "$@"
      else
        ${pkgs.espanso-wayland}/bin/espanso "$@"
      fi
    '';
}
