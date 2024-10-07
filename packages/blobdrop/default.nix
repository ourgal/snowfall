{
  lib,
  stdenv,
  fetchFromGitHub,
  pkgs,
  namespace,
}:
let
  quartz = pkgs.fetchFromGitHub {
    inherit (lib.${namespace}.sources.quartz.src)
      owner
      repo
      rev
      sha256
      ;
  };
  pname = "blobdrop";
  source = lib.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

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
