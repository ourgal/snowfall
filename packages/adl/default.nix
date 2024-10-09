{
  lib,
  stdenvNoCC,
  makeWrapper,
  frece,
  fzf,
  mpv,
  perl,
  trackma,
  ueberzugpp,
  pkgs,
  namespace,
}:
let
  pname = "adl";
  source = pkgs.${namespace}.sources.${pname};
in
stdenvNoCC.mkDerivation rec {
  inherit (source) pname src version;

  nativeBuildInputs = [ makeWrapper ];

  # https://github.com/RaitaroH/adl#requirements
  buildInputs = [
    pkgs.${namespace}.animdl
    frece
    fzf
    mpv
    perl
    trackma
    ueberzugpp
  ];

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp $src/adl $out/bin
    wrapProgram $out/bin/adl \
      --prefix PATH : ${lib.makeBinPath buildInputs}
  '';

  meta = with lib; {
    homepage = "https://github.com/RaitaroH/adl";
    description = "Popcorn anime scraper/downloader + trackma wrapper";
    license = licenses.gpl3Only;
    platforms = platforms.linux;
    maintainers = with maintainers; [ weathercold ];
    mainProgram = "adl";
  };
}
