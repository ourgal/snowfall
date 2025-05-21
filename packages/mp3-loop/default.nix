{
  lib,
  stdenv,
  _sources',
  cmake,
  pkg-config,
  lame,
  libmpg123,
  libsndfile,
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    libsndfile
    lame
    libmpg123
  ];

  meta = {
    description = "A simple C tool to convert any MP3 into a seamless 1-hour loop with crossfades. Inspired by YouTube's 1-hour chill playlists. Perfect for relaxing, studying, or looping your favorite song offline";
    homepage = "https://github.com/LjubeC-dev/mp3-loop";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "mp3_loop";
    platforms = lib.platforms.all;
  };
}
