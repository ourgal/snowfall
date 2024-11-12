{
  lib,
  stdenv,
  perl,
  _sources,
}:

stdenv.mkDerivation {
  inherit (_sources.pmark) pname version src;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 pmark -t $out/bin
    substituteInPlace $out/bin/pmark --replace-fail '/usr/bin/env perl' ${perl}/bin/perl
    runHook postInstall
  '';

  meta = with lib; {
    description = "A hacky, markdown pre-processor/generator";
    homepage = "https://github.com/purarue/pmark";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "pmark";
    platforms = platforms.all;
  };
}
