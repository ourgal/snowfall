{
  lib,
  stdenv,
  pkgs,
  namespace,
}:
let
  quartz = pkgs.${namespace}.sources.quartz.src;
  pname = "blobdrop";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname src version;

  nativeBuildInputs = with pkgs; [
    cmake
    pkg-config
    qt6.wrapQtAppsHook
  ];

  buildInputs = with pkgs; [
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qtsvg
    xorg.libxcb
    xorg.xcbutilwm
  ];

  cmakeFlags = [ ("-DFETCHCONTENT_SOURCE_DIR_QUARTZ=" + quartz) ];

  meta = with lib; {
    description = "Drag and drop files directly out of the terminal";
    homepage = "https://github.com/vimpostor/blobdrop";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "blobdrop";
    platforms = platforms.all;
  };
}
