{
  lib,
  stdenv,
  _sources',
}:
stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  installPhase = ''
    runHook preInstall
    install -Dm755 sequin -t $out/bin
    runHook postInstall
  '';

  meta = with lib; {
    description = "Human-readable ANSI sequences";
    homepage = "https://github.com/charmbracelet/sequin";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "sequin";
  };
}
