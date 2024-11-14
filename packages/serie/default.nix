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
  hash = "Phj+DJbB8x3UOKNFQOfejbdtAj9Fnj+ROAe4imPs/Rw=";
in
stdenv.mkDerivation rec {
  inherit (_sources.serie) pname version;

  src = fetchzip {
    url = "https://github.com/lusingander/serie/releases/download/v${version}/serie-${version}-x86_64-unknown-linux-gnu.tar.gz";
    sha256 = hash;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 serie -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/lusingander/serie/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "A rich git commit graph in your terminal, like magic";
    homepage = "https://github.com/lusingander/serie";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "serie";
  };
}
