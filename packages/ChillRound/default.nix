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
    rm -rf __MACOSX
  '';

  nativeBuildInputs = [ p7zip ];

  installPhase = ''
    runHook preInstall
    install -Dm0644 *.otf -t $out/share/fonts/opentype
    runHook postInstall
  '';

  meta = {
    description = "圆体字体拓展计划立项";
    homepage = "https://github.com/Warren2060/ChillRound";
    license = lib.licenses.ofl;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "chill-round";
    platforms = lib.platforms.all;
  };
}
