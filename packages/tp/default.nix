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
    install -Dm755 tp -t $out/bin
    runHook postInstall
  '';

  meta = with lib; {
    description = "Display the result of the commands at every keystroke";
    homepage = "https://github.com/minefuto/tp";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "tp";
    platforms = platforms.x86_64-linux;
  };
}
