{
  stdenv,
  fetchFromGitHub,
  xorg,
}:

stdenv.mkDerivation {
  name = "dmenu";

  src = fetchFromGitHub {
    owner = "axyl-os";
    repo = "axyl-dmenu";
    rev = "a7ce8093b3432f58e812b1f1e14333d8cdf63cbb";
    sha256 = "11piz0cd8f64pfpjzb9rnnpz1cm2nmcl8wwngal7j03rs6504b68";
  };
  buildInputs = [
    xorg.libX11
    xorg.libXinerama
    xorg.libXft
  ];
  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp dmenu $out/bin
    cp dmenu_path $out/bin
    cp dmenu_run $out/bin
    cp stest $out/bin
    runHook postInstall  
  '';
}
