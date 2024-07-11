{ stdenv, fetchFromGitHub, ... }:

stdenv.mkDerivation {
  pname = "jerry";
  version = "unstable-2024-07-08";

  src = fetchFromGitHub {
    owner = "justchokingaround";
    repo = "jerry";
    rev = "761b7b6f19af063bc908f56842dab167b0ce0af8";
    sha256 = "0vbp48xx0a4mdsdvbjamiafzmmhvwlqsfdch26r5s1fs5nrsp6g2";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D ./jerry.sh $out/bin/jerry
    runHook postInstall
  '';
}
