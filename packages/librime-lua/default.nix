{ fetchzip, stdenv, ... }:
stdenv.mkDerivation rec {
  name = "librime-lua";
  commit = "7c1b93965962b7c480d4d7f1a947e4712a9f0c5f";

  src = fetchzip {
    url = "https://github.com/lotem/librime-lua/archive/${commit}/librime-lua-${commit}.tar.gz";
    sha256 = "sha256-H/ufyHIfYjAjF/Dt3CilL4x9uAXGcF1BkdAgzIbSGA8=";
  };

  installPhase = ''
    runHook preInstall
    cp -r . $out
    runHook postInstall
  '';
}
