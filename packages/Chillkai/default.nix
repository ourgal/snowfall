{
  lib,
  stdenv,
  p7zip,
  _sources',
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  unpackCmd = ''
    7z x $src
    rm -rf __MACOSX
  '';

  installPhase = ''
    runHook preInstall
    install -Dm0644 *.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';

  nativeBuildInputs = [ p7zip ];

  meta = {
    description = "为优化中西文排版的楷体项目";
    homepage = "https://github.com/Warren2060/Chillkai";
    license = lib.licenses.ofl;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
