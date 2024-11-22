{
  lib,
  stdenv,
  fetchzip,
  writeShellScriptBin,
  curl,
  jq,
  gnused,
  _sources,
}:
let
  hash = "jcbeTBexUAZ+NuGwqhsE+JUGhEfXg43Pz4dy8vOUZ8Q=";
in
stdenv.mkDerivation rec {
  inherit (_sources.sequin) pname version;

  src = fetchzip {
    url = "https://github.com/charmbracelet/sequin/releases/download/v${version}/sequin_${version}_Linux_x86_64.tar.gz";
    sha256 = hash;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 sequin -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/charmbracelet/sequin/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "Human-readable ANSI sequences";
    homepage = "https://github.com/charmbracelet/sequin";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "sequin";
  };
}
