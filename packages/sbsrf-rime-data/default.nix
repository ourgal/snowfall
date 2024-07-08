{ fetchzip, stdenv, ... }:
stdenv.mkDerivation rec {
  name = "sbsrf-rime-data";
  version = "20240708";

  src = fetchzip {
    url = "https://github.com/sbsrf/sbsrf/releases/download/${version}/sbsrf.zip";
    hash = "sha256-fx/vxIAMg0YDuaXikaSOUOk0XYNI1KAyIbOEYZtPBKQ=";
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
