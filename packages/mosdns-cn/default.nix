{
  lib,
  stdenv,
  fetchzip,
  writeShellScriptBin,
  curl,
  jq,
  gnused,
  _sources',
}:
let
  hash = "M4syjEBET8ZmGx4dPanyE82w72I8GLxLsDzNLKKNeGo=";
in
stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version;

  src = fetchzip {
    url = "https://github.com/IrineSistiana/mosdns-cn/releases/download/v${version}/mosdns-cn-linux-amd64.zip";
    sha256 = hash;
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 mosdns-cn -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/IrineSistiana/mosdns-cn/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "A simple DNS forwarder that can make life easier. (Not maintained";
    homepage = "https://github.com/IrineSistiana/mosdns-cn";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "mosdns-cn";
    platforms = platforms.x86_64;
  };
}
