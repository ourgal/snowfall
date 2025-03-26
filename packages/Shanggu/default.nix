{
  lib,
  stdenv,
  _sources',
  p7zip,
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  unpackCmd = "7z x $src -otemp";

  installPhase = ''
    runHook preInstall
    for d in */ ; do
      cd "$d"
      install -Dm0644 *.ttf -t $out/share/fonts/truetype
      cd ..
    done
    runHook postInstall
  '';

  nativeBuildInputs = [ p7zip ];

  meta = {
    description = "基於思源的傳承字形（舊字形）字體 尚古 Shanggu Fonts";
    homepage = "https://github.com/GuiWonder/Shanggu";
    license = lib.licenses.ofl;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
