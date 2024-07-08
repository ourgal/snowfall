{
  writeShellApplication,
  lib,
  pkgs,
  ...
}:
writeShellApplication {
  name = "vscode-json-language-server";

  meta = {
    mainProgram = "vscode-json-language-server";
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = # bash
    ''
      exec -a $0 ${pkgs.nodePackages.vscode-json-languageserver}/bin/vscode-json-languageserver $@
    '';
}
