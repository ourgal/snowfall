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
  hash = "4ZqsjzyZTv6gNIpLGkWS5i+WBFrnrOzvFSWTwuGrwRA=";
in
stdenv.mkDerivation rec {
  inherit (_sources.rustywatch) pname version;

  src = fetchzip {
    url = "https://github.com/ak9024/rustywatch/releases/download/v${version}/rustywatch-${version}-x86_64-unknown-linux-gnu.tar.gz";
    sha256 = hash;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 rustywatch -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/ak9024/rustywatch/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "Live Reloading Built with Rust";
    homepage = "https://github.com/ak9024/rustywatch";
    changelog = "https://github.com/ak9024/rustywatch/blob/v${version}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "rustywatch";
  };
}
