{
  lib,
  stdenv,
  namespace,
  pkgs,
}:
let
  pname = "git-ink";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname version src;

  installPhase = ''
    runHook preInstall
    install -m755 -D git-ink $out/bin/git-ink
    runHook postInstall
  '';

  meta = with lib; {
    description = "Annotate your git branches";
    homepage = "https://github.com/davidosomething/git-ink";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-ink";
    platforms = platforms.all;
  };
}
