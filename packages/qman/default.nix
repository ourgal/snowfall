{
  lib,
  stdenv,
  meson,
  pkg-config,
  pandoc,
  python3,
  cmake,
  zlib,
  ncurses,
  inih,
  ninja,
  bzip2,
  _sources',
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  nativeBuildInputs = [
    meson
    ninja
    pandoc
    pkg-config
    cmake
    (python3.withPackages (ps: [ ps.cogapp ]))
  ];

  buildInputs = [
    zlib
    ncurses
    inih
    bzip2
  ];

  meta = {
    description = "A more modern man page viewer for our terminals";
    homepage = "https://github.com/plp13/qman";
    license = lib.licenses.bsd2;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "qman";
    platforms = lib.platforms.all;
  };
}
