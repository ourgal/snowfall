{
  stdenv,
  fzf,
  ueberzugpp,
  curl,
  mpv,
  jq,
  fetchFromGitHub,
  ...
}:

stdenv.mkDerivation {
  pname = "jerry";
  version = "unstable-2024-06-19";

  src = fetchFromGitHub {
    owner = "justchokingaround";
    repo = "jerry";
    rev = "989ec646f514387265a1f19550d24914ba67fcdf";
    hash = "sha256-pjS2b2P15z9LqwoHqG02vtX/mVeKM4t5dmn5URiszeI=";
  };

  buildInputs = [
    curl
    mpv
    jq
    ueberzugpp
    fzf
  ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D ./jerry.sh $out/bin/jerry
    runHook postInstall
  '';
}
