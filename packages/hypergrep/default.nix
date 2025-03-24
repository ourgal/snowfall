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
  hash = "L4DRzWqMB+wWmbbF54Fuu4LQjfbu9FmAK3pMAmBKpAk=";
in
stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version;

  src = fetchzip {
    url = "https://github.com/p-ranav/hypergrep/releases/download/v${version}/hg_${version}.zip";
    sha256 = hash;
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 hg $out/bin/hypergrep
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/p-ranav/hypergrep/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "Recursively search directories for a regex pattern";
    homepage = "https://github.com/p-ranav/hypergrep";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "hypergrep";
    platforms = platforms.all;
  };
}
