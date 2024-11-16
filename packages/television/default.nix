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
  hash = "T9Q2j/fgtLdyYqsGlnkIqO6etIFueRSfFA7SuP0MvRM=";
in
stdenv.mkDerivation rec {
  inherit (_sources.television) pname version;

  src = fetchzip {
    url = "https://github.com/alexpasmantier/television/releases/download/${version}/tv-${version}-linux-x86_64.tar.gz";
    sha256 = hash;
  };

  installPhase = ''
    runHook preInstall
    install -Dm755 tv -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/alexpasmantier/television/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "The revolution will (not) be televised";
    homepage = "https://github.com/alexpasmantier/television";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "television";
    platforms = platforms.x86_64;
  };
}
