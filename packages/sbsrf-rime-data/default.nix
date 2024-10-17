{
  fetchzip,
  stdenv,
  namespace,
  pkgs,
}:
let
  name = "sbsrf-rime-data";
  source = pkgs.${namespace}.sources.${name};
in
stdenv.mkDerivation rec {
  inherit (source) pname version;

  src = fetchzip {
    url = "https://github.com/sbsrf/sbsrf/releases/download/${version}/sbsrf.zip";
    hash = "sha256-XIz53/6XGrnnE0qOQzsl9Q9zFvDpi5aOt1xB2pqRU/c=";
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
