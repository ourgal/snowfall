{ fetchzip, stdenv, ... }:
stdenv.mkDerivation rec {
  name = "sbsrf-rime-data";
  version = "20240809";

  src = fetchzip {
    url = "https://github.com/sbsrf/sbsrf/releases/download/${version}/sbsrf.zip";
    hash = "sha256-6XRCQP7cvK25BZdv37Yi9o+/O62Eovw7TeU7PHq225Q=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/rime-data
    rm ./default.custom.yaml
    cp -r ./* $out/share/rime-data
    runHook postInstall
  '';
}
