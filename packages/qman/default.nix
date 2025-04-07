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
  xz,
  cunit,
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
    cunit
  ];

  mesonFlags =
    let
      inherit (lib.strings) mesonEnable;
    in
    [
      (mesonEnable "tests" false)
      (mesonEnable "config" false)
    ];

  buildInputs = [
    zlib
    ncurses
    inih
    bzip2
    xz
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
