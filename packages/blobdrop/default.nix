{
  lib,
  stdenv,
  fetchFromGitHub,
  pkgs,
}:
let
  quartz = pkgs.fetchFromGitHub {
    owner = "vimpostor";
    repo = "quartz";
    rev = "9f1ac6cce6b338c6613aa195cffe6f0bb5c965df";
    hash = "sha256-UacYQ5c+MGUK4saLohnZs4691CBGI59JpkdgCaYbPUk=";
  };
in
stdenv.mkDerivation rec {
  pname = "blobdrop";
  version = "2.1";

  src = fetchFromGitHub {
    owner = "vimpostor";
    repo = "blobdrop";
    rev = "v${version}";
    hash = "sha256-o2+qtkyu2qcwXpum3KiogyO8D6aY7bRJ6y4FWQKQY/o=";
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
