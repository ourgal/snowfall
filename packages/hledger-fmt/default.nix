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
  hash = "sha256-gVZPjnhOntTC1WmRm+5eeKN0MhNxiXvi31q4vnKjNUA=";
in
stdenv.mkDerivation rec {
  inherit (_sources.hledger-fmt) pname version;

  src = fetchzip {
    url = "https://github.com/mondeja/hledger-fmt/releases/download/v${version}/hledger-fmt-x86_64-unknown-linux-gnu.tar.gz";
    sha256 = hash;
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 hledger-fmt -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/mondeja/hledger-fmt/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "An opinionated hledger's journal files formatter";
    homepage = "https://github.com/mondeja/hledger-fmt";
    changelog = "https://github.com/mondeja/hledger-fmt/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "hledger-fmt";
  };
}
