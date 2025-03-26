{
  lib,
  stdenv,
  _sources',
  p7zip,
}:
stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  unpackCmd = ''
    7z x $src
  '';

  installPhase = ''
    runHook preInstall
    install -Dm755 gif-progress -t $out/bin
    runHook postInstall
  '';

  nativeBuildInputs = [ p7zip ];

  meta = with lib; {
    description = "Attach progress bar to animated GIF";
    homepage = "https://github.com/nwtgck/gif-progress";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gif-progress";
    platforms = platforms.x86_64-linux;
  };
}
