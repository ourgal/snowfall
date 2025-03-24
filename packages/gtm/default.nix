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
  hash = "Jb8JCKJ4WvA7hLwDkywnBIW+xOYrr3Uww3/OUUk+ZDI=";
in
stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version;

  src = fetchzip {
    url = "https://github.com/git-time-metric/gtm/releases/download/v${version}/gtm.v${version}.linux.tar.gz";
    sha256 = hash;
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 gtm -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/git-time-metric/gtm/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "Simple, seamless, lightweight time tracking for Git";
    homepage = "https://github.com/git-time-metric/gtm";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gtm";
    platforms = platforms.all;
  };
}
