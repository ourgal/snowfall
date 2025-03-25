{ stdenvNoCC, p7zip, ... }:

stdenvNoCC.mkDerivation {
  pname = "caskaydiaCove-nerd-font";
  version = "Amitabha37377";

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
