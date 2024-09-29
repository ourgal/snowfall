{
  lib,
  stdenv,
  fetchFromGitHub,
  meson,
  ninja,
}:

stdenv.mkDerivation rec {
  pname = "facad";
  version = "1.4.0";

  src = fetchFromGitHub {
    owner = "yellow-footed-honeyguide";
    repo = "facad";
    rev = "v${version}";
    hash = "sha256-u6UIed6a2J6dJYlN6b4adnVJHaiRvRK7Afpl4o2IMeM=";
  };

  nativeBuildInputs = [
    meson
    ninja
  ];

  meta = with lib; {
    description = "A modern, colorful directory listing tool for the command line";
    homepage = "https://github.com/yellow-footed-honeyguide/facad";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "facad";
    platforms = platforms.all;
  };
}
