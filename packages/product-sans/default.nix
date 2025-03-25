{ stdenvNoCC, p7zip, ... }:

stdenvNoCC.mkDerivation {
  pname = "product-sans";
  version = "alphaTechnolog";

  unpackCmd = ''
    7z x font.7z
  '';

  src = ./font.7z;

  nativeBuildInputs = [ p7zip ];

  installPhase = ''
    runHook preInstall
    install -Dm644 *.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';
}
