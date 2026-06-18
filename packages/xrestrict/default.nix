{
  lib,
  stdenv,
  libx11,
  libxi,
  libxrandr,
  xinput,
  libxext,
  pkg-config,
  autoreconfHook,
  _sources',
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  buildInputs = [
    libx11
    libxrandr
    libxext
    libxi
    xinput
  ];

  nativeBuildInputs = [
    autoreconfHook
    pkg-config
  ];

  meta = {
    description = "A utility to modify the \"Coordinate Transformation Matrix\" of an XInput2 pointer device";
    homepage = "https://github.com/Ademan/xrestrict";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "xrestrict";
    platforms = lib.platforms.all;
  };
}
