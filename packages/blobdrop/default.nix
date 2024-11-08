{
  lib,
  stdenv,
  _sources,
  qt6,
  xorg,
  cmake,
  pkg-config,
}:
stdenv.mkDerivation {
  inherit (_sources.blobdrop) pname src version;

  nativeBuildInputs = [
    cmake
    pkg-config
    qt6.wrapQtAppsHook
  ];

  buildInputs = [
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qtsvg
    xorg.libxcb
    xorg.xcbutilwm
  ];

  cmakeFlags = [ ("-DFETCHCONTENT_SOURCE_DIR_QUARTZ=" + _sources.quartz.src) ];

  meta = with lib; {
    description = "Drag and drop files directly out of the terminal";
    homepage = "https://github.com/vimpostor/blobdrop";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "blobdrop";
    platforms = platforms.all;
  };
}
