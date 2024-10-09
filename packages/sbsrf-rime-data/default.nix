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
    hash = "sha256-YjYUB5LNpzXCtU9cX4pDp5mJ+0Pd17r98LslaK2E4y4=";
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
