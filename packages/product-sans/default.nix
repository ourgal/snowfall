{ stdenvNoCC, ... }:

stdenvNoCC.mkDerivation {
  pname = "product-sans";
  version = "alphaTechnolog";

  src = ./google-sans;

  installPhase = ''
    runHook preInstall
    install -Dm644 *.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';
}
