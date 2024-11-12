{
  lib,
  stdenv,
  _sources,
}:
stdenv.mkDerivation {
  inherit (_sources.corgi) pname version src;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 corgi -t $out/bin
    runHook postInstall
  '';

  meta = with lib; {
    description = "Corgi is a command-line workflow manager that helps with your repetitive command usages by organizing them into reusable snippet";
    homepage = "https://github.com/junyu-w/corgi";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "corgi";
    platforms = platforms.linux;
  };
}
