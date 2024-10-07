{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
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
  source = lib.${namespace}.sources.${pname};
in
stdenvNoCC.mkDerivation rec {
  inherit pname;
  version = "unstable-${source.date}";

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

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
