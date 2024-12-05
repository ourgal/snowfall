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
  hash = "g9C8AYHhDz0H7E15BaRcjtatmlYm7NAsq+t7MbBN98Y=";
in
stdenv.mkDerivation rec {
  inherit (_sources.comigo) pname version;

  src = fetchzip {
    url = "https://github.com/yumenaka/comigo/releases/download/v${version}/comi_v${version}_Linux_x86_64.tar.gz";
    sha256 = hash;
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 comi -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/yumenaka/comigo/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "Comigo：Comic & Manga Reader in Linux，Windows，Mac OS。简单的漫画阅读器，跨平台，支持各种压缩文件格式。わかりやすい漫画リーダー";
    homepage = "https://github.com/yumenaka/comigo";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "comi";
  };
}
