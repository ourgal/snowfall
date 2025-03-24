{
  stdenv,
  fetchzip,
  writeShellScriptBin,
  curl,
  jq,
  gnused,
  _sources',
}:
let
  hash = "A1G2ECju7ZhnEWTIYkX9S8mDNrytwCOSW3l4CK3OLkI=";
in
stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version;

  src = fetchzip {
    url = "https://github.com/sbsrf/sbsrf/releases/download/${version}/sbsrf.zip";
    sha256 = hash;
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/rime-data
    cp -r ./* $out/share/rime-data
    substituteInPlace $out/share/rime-data/lua/sbxlm/radicals.lua \
      --replace-fail 'rime.api.get_user_data_dir() .. "/lua/sbxlm/radicals.txt"' "\"$out/share/rime-data/lua/sbxlm/radicals.txt\""
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/sbsrf/sbsrf/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';
}
