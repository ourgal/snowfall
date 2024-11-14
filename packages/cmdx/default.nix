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
  hash = "lo2iv5gYAqGOIBKIgOLNVc8qAACzxzTzhXjJdITNRLE=";
in
stdenv.mkDerivation rec {
  inherit (_sources.cmdx) pname version;

  src = fetchzip {
    url = "https://github.com/suzuki-shunsuke/cmdx/releases/download/v${version}/cmdx_linux_amd64.tar.gz";
    sha256 = hash;
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 cmdx -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/suzuki-shunsuke/cmdx/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "Task runner. It provides useful help messages and supports interactive prompts and validation of arguments";
    homepage = "https://github.com/suzuki-shunsuke/cmdx";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "cmdx";
  };
}
