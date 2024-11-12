{
  lib,
  stdenv,
  _sources,
}:

stdenv.mkDerivation {
  inherit (_sources.gif-progress) pname version src;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 gif-progress -t $out/bin
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
