{ stdenv, fetchFromGitHub, ... }:

stdenv.mkDerivation {
  pname = "c";
  version = "unstable-2023-11-24";

  src = fetchFromGitHub {
    owner = "ryanmjacobs";
    repo = "c";
    rev = "7cdc09e69d2f7fc49f70c80c565aa09b19e666db";
    sha256 = "0il12b5b2sdr3y8j2pwiikpb8d8qy5bzr6q50wp4p81k0kvlrqbl";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D ./c $out/bin/c
    runHook postInstall
  '';
}
