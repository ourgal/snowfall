{
  stdenv,
  fetchzip,
  writeShellScriptBin,
  curl,
  jq,
  gnused,
  _sources,
}:
let
  hash = "XIz53/6XGrnnE0qOQzsl9Q9zFvDpi5aOt1xB2pqRU/c=";
in
stdenv.mkDerivation rec {
  inherit (_sources.sbsrf-rime-data) pname version;

  src = fetchzip {
    url = "https://github.com/sbsrf/sbsrf/releases/download/${version}/sbsrf.zip";
    sha256 = hash;
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/rime-data
    rm ./default.custom.yaml
    cp -r ./* $out/share/rime-data
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/sbsrf/sbsrf/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';
}
