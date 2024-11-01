{
  lib,
  stdenv,
  pkgs,
  namespace,
}:
let
  pname = "pls";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname src version;

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -Dm755 release/pls $out/bin/pls

    runHook postInstall
  '';

  meta = with lib; {
    description = "Pls centralize aliases! Unify your workflow with context-aware aliases for commands";
    homepage = "https://github.com/codevogel/pls";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "pls";
    platforms = platforms.all;
  };
}
