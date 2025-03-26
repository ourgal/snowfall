{
  lib,
  stdenv,
  _sources',
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  installPhase = ''
    runHook preInstall
    cd fonts/ttf
    install -Dm0644 *.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';

  meta = {
    description = "";
    homepage = "https://github.com/jeffreyxuan/toneoz-font-pinyin-kai";
    license = lib.licenses.arphicpl;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
