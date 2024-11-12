{
  lib,
  stdenv,
  _sources,
}:
stdenv.mkDerivation {
  inherit (_sources.hl) pname version src;

  sourceRoot = ".";

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 hl -t $out/bin
    runHook postInstall
  '';

  meta = with lib; {
    description = "A fast and powerful log viewer and processor that translates JSON or logfmt logs into a pretty human-readable format";
    homepage = "https://github.com/pamburus/hl";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "hl";
  };
}
