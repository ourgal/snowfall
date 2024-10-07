{
  lib,
  stdenv,
  fetchFromGitHub,
  meson,
  ninja,
  namespace,
}:
let
  pname = "facad";
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
