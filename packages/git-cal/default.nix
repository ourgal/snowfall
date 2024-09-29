{
  lib,
  stdenv,
  fetchFromGitHub,
  perl,
}:

stdenv.mkDerivation rec {
  pname = "git-cal";
  version = "0.9.1";

  src = fetchFromGitHub {
    owner = "k4rthik";
    repo = "git-cal";
    rev = "v${version}";
    hash = "sha256-fzzcxGre3YebvFrSRrul2L73mfQF/4ubsGVSPFzUSSM=";
  };

  dontBuild = true;

  buildInputs = [ perl ];

  installPhase = ''
    runHook preInstall
    install -m755 -D git-cal $out/bin/git-cal
    runHook postInstall
  '';

  meta = with lib; {
    description = "Github like contributions calendar on terminal";
    homepage = "https://github.com/k4rthik/git-cal";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-cal";
    platforms = platforms.all;
  };
}
