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
  hash = "JxmO0nLa+zL+ZKhitMXcdPb/XsPZ9cvocc1CmB+7bZ0=";
in
stdenv.mkDerivation rec {
  inherit (_sources.hl) pname version;

  src = fetchzip {
    url = "https://github.com/pamburus/hl/releases/download/v${version}/hl-linux-x86_64-gnu.tar.gz";
    sha256 = hash;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 hl -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/pamburus/hl/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "A fast and powerful log viewer and processor that translates JSON or logfmt logs into a pretty human-readable format";
    homepage = "https://github.com/pamburus/hl";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "hl";
  };
}
