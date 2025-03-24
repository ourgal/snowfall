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
  hash = "uxH/JnCyUM2jANONLtAPyXmVYfdGIPw/WE4VGD27nb4=";
in
stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version;

  src = fetchzip {
    url = "https://github.com/nwtgck/gif-progress/releases/download/${version}/gif-progress-linux-amd64.tar.gz";
    sha256 = hash;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 gif-progress -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/nwtgck/gif-progress/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "Attach progress bar to animated GIF";
    homepage = "https://github.com/nwtgck/gif-progress";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gif-progress";
  };
}
