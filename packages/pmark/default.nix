{
  lib,
  stdenv,
  perl,
  _sources',
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 pmark -t $out/bin
    patchShebangs $out/bin/pmark
    runHook postInstall
  '';

  nativeBuildInputs = [ perl ];

  meta = with lib; {
    description = "A hacky, markdown pre-processor/generator";
    homepage = "https://github.com/purarue/pmark";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "pmark";
    platforms = platforms.all;
  };
}
