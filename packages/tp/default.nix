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
  hash = "+ziOARrOL03AuMb9axU9BlPD+ZAp4XC1N0YAJLr0SfA=";
in
stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version;

  src = fetchzip {
    url = "https://github.com/minefuto/tp/releases/download/v${version}/tp_Linux_x86_64.tar.gz";
    sha256 = hash;
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall
    install -Dm755 tp -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/minefuto/tp/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "Display the result of the commands at every keystroke";
    homepage = "https://github.com/minefuto/tp";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "tp";
  };
}
