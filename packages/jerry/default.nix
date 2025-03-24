{
  lib,
  stdenv,
  _sources',
}:
stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D jerry.sh $out/bin/jerry
    runHook postInstall
  '';

  meta = with lib; {
    description = "Watch anime with automatic anilist syncing and other cool stuff";
    homepage = "https://github.com/justchokingaround/jerry";
    license = licenses.gpl3;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "jerry";
    platforms = platforms.all;
  };
}
