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
  hash = "kknG30eFwRYclmrxNjAaGllCiT22QhpsCd1SFjyjxAg=";
in
stdenv.mkDerivation rec {
  inherit (_sources.mdsf) pname version;

  src = fetchzip {
    url = "https://github.com/hougesen/mdsf/releases/download/v${version}/mdsf-x86_64-unknown-linux-gnu.tar.gz";
    sha256 = hash;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 mdsf -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/hougesen/mdsf/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "Format markdown code blocks using your favorite code formatters";
    homepage = "https://github.com/hougesen/mdsf";
    changelog = "https://github.com/hougesen/mdsf/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "mdsf";
    platforms = platforms.x86_64;
  };
}
