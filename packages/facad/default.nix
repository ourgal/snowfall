{
  lib,
  stdenv,
  meson,
  ninja,
  namespace,
  pkgs,
}:
let
  pname = "facad";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname src version;

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
