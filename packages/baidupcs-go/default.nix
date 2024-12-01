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
  hash = "ctLbvW93rHyFOY5M1Wmz0ZtIk+ZGtdCna3FaovWs31k=";
in
stdenv.mkDerivation rec {
  inherit (_sources.baidupcs-go) pname version;

  src = fetchzip {
    url = "https://github.com/qjfoidnh/BaiduPCS-Go/releases/download/v${version}/BaiduPCS-Go-v${version}-linux-amd64.zip";
    sha256 = hash;
  };

  installPhase = ''
    runHook preInstall
    install -Dm755 BaiduPCS-Go -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/qjfoidnh/BaiduPCS-Go/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "Iikira/BaiduPCS-Go原版基础上集成了分享链接/秒传链接转存功能";
    homepage = "https://github.com/qjfoidnh/BaiduPCS-Go";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "BaiduPCS-Go";
  };
}
