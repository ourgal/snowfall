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
  hash = "sha256-te3noC0hyF+iRzYXjhGhfzs5Q9GgQ+eMxnEfN6MM7B0=";
in
stdenv.mkDerivation rec {
  inherit (_sources.is) pname version;

  src = fetchzip {
    url = "https://github.com/oalders/is/releases/download/v${version}/is_Linux_x86_64.tar.gz";
    sha256 = hash;
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 is -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/oalders/is/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "An inspector for your environment";
    homepage = "https://github.com/oalders/is";
    changelog = "https://github.com/oalders/is/blob/${src.rev}/CHANGELOG.md";
    license = with licenses; [
      asl20
      mit
    ];
    maintainers = with maintainers; [ zxc ];
    mainProgram = "is";
  };
}
