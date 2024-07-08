{ fetchzip, stdenv, ... }:
stdenv.mkDerivation rec {
  name = "librime-octagram";
  commit = "f92e083052b9983ee3cbddcda5ed60bb3c068e24";

  src = fetchzip {
    url = "https://github.com/lotem/librime-octagram/archive/${commit}/librime-octagram-${commit}.tar.gz";
    sha256 = "sha256-ShQ7Nvrr7w/6cd9lTnQvrk2AS6rSz/PAknCjZOqiBsM=";
  };

  installPhase = ''
    runHook preInstall
    cp -r . $out
    runHook postInstall
  '';
}
