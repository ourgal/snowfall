{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "icomoon";
  version = "tartarus";

  src = fetchFromGitHub {
    owner = "AllJavi";
    repo = "tartarus-dotfiles";
    rev = "01a110e07a1b1dd2aaf6f6473e8d41d8308e964d";
    hash = "sha256-Zph71TA5lp8SaOoZ3ncawFeib3ze0/PAFEPI6tJOh/Q=";
  };

  installPhase = ''
    runHook preInstall
    install -Dm644 .local/share/fonts/ttf/icomoon/icomoon.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';
}
