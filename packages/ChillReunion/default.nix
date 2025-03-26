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

  installPhase = ''
    runHook preInstall
    install -Dm0644 *.otf -t $out/share/fonts/opentype
    runHook postInstall
  '';

  nativeBuildInputs = [ p7zip ];

  meta = {
    description = "得意黑二创字体";
    homepage = "https://github.com/Warren2060/ChillReunion";
    license = lib.licenses.ofl;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
