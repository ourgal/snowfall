{
  lib,
  stdenv,
  _sources,
}:

stdenv.mkDerivation {
  inherit (_sources.television) pname version src;

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    install -Dm755 tv -t $out/bin
    runHook postInstall
  '';

  meta = with lib; {
    description = "The revolution will (not) be televised";
    homepage = "https://github.com/alexpasmantier/television";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "television";
    platforms = platforms.x86_64;
  };
}
