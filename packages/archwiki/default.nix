{
  stdenv,
  fetchzip,
  fetchFromGitHub,
  ...
}:

stdenv.mkDerivation {
  pname = "archwiki";
  version = "20230915";

  srcs = [
    (fetchzip {
      name = "doc";
      url = "https://github.com/filiparag/wikiman/releases/download/2.13.2/arch-wiki_20230915.tar.xz";
      hash = "sha256-FUm6Rdb+Cs0JfdWBDPcPGADgzUEOs5npOYIAbft6Cv0=";
    })
    (fetchFromGitHub {
      owner = "ourgal";
      repo = "archwiki-offline";
      rev = "2fb9016a28f9982727e49ffc5e0c4ab349394c38";
      sha256 = "0py8gyh9wjpm0ziy6pal8d5x806lxa1mzzwsdxhzh6a579lrx5fn";
    })
  ];

  sourceRoot = ".";

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D source/archwiki-offline $out/bin/archwiki
    mkdir -p $out/share
    cp -r doc/share/doc $out/share
    runHook postInstall
  '';
}
