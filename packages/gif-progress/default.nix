{
  lib,
  stdenv,
  fetchzip,
}:

stdenv.mkDerivation rec {
  pname = "gif-progress";
  version = "release-fix-not-moving-progress-bar";

  src = fetchzip {
    url = "https://github.com/nwtgck/gif-progress/releases/download/${version}/gif-progress-linux-amd64.tar.gz";
    hash = "sha256-uxH/JnCyUM2jANONLtAPyXmVYfdGIPw/WE4VGD27nb4=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D gif-progress -t $out/bin
    runHook postInstall
  '';

  meta = with lib; {
    description = "Attach progress bar to animated GIF";
    homepage = "https://github.com/nwtgck/gif-progress";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gif-progress";
  };
}
