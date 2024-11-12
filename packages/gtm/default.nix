{
  lib,
  stdenv,
  _sources,
}:
stdenv.mkDerivation {
  inherit (_sources.gtm) pname version src;

  sourceRoot = ".";

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 gtm -t $out/bin
    runHook postInstall
  '';

  meta = with lib; {
    description = "Simple, seamless, lightweight time tracking for Git";
    homepage = "https://github.com/git-time-metric/gtm";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gtm";
    platforms = platforms.all;
  };
}
