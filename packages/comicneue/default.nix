{
  lib,
  stdenv,
  _sources',
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  installPhase = ''
    runHook preInstall
    cd "Fonts/TTF/ComicNeue"
    install -Dm0644 *.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';

  meta = {
    description = "Comic Neue is a font that fixes the shortcomings of Comic Sans";
    homepage = "https://github.com/crozynski/comicneue";
    license = lib.licenses.ofl;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
