{ stdenvNoCC, ... }:

stdenvNoCC.mkDerivation {
  pname = "ubuntu-nerd-font";
  version = "Amitabha37377";

  src = ./fonts;

  installPhase = ''
    runHook preInstall
    install -Dm644 *.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';
}
