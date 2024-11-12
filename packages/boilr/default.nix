{
  lib,
  stdenv,
  _sources,
}:
stdenv.mkDerivation {
  inherit (_sources.boilr) pname version src;

  sourceRoot = ".";

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 boilr -t $out/bin
    runHook postInstall
  '';

  meta = with lib; {
    description = "Zap: boilerplate template manager that generates files or directories from template repositories";
    homepage = "https://github.com/tmrts/boilr";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "boilr";
    platforms = platforms.all;
  };
}
