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
