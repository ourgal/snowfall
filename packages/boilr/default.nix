{
  lib,
  stdenv,
  _sources',
}:
stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  unpackCmd = ''
    mkdir temp
    tar -xf $src --directory=temp
  '';

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
    platforms = [ "x86_64-linux" ];
  };
}
