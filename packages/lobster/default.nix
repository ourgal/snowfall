{
  stdenvNoCC,
  coreutils,
  curl,
  ffmpeg,
  fzf,
  gnugrep,
  gnupatch,
  gnused,
  html-xml-utils,
  lib,
  makeWrapper,
  mpv,
  openssl,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation {
  pname = "lobster";
  version = "4.3.0";

  src = fetchFromGitHub {
    owner = "justchokingaround";
    repo = "lobster";
    rev = "v4.3.0";
    hash = "sha256-ch91LYKs6MswTC08Xi8VcIxooWvDprGuIn0B2Yo3ufo=";
  };

  nativeBuildInputs = [ makeWrapper ];

  wrapperPaths = lib.makeBinPath [
    coreutils
    curl
    ffmpeg
    fzf
    gnugrep
    gnupatch
    gnused
    html-xml-utils
    mpv
    openssl
  ];

  dontBuild = true;

  preInstall = ''
    patchShebangs --host lobster.sh
  '';

  installPhase = ''
    runHook preInstall;
    mkdir -p $out/bin
    cp lobster.sh $out/bin/lobster
    runHook postInstall
  '';

  postInstall = ''
    wrapProgram $out/bin/lobster \
      --prefix PATH : $wrapperPaths
  '';

  meta = {
    description = "CLI to watch Movies/TV Shows from the terminal";
    homepage = "https://github.com/justchokingaround/lobster";
    license = lib.licenses.gpl2;
    maintainers = with lib.maintainers; [ NotAShelf ];
    mainProgram = "lobster";
    platforms = lib.platforms.unix;
    sourceProvenance = [ lib.sourceTypes.fromSource ];
  };
}