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
  hash = "kKJ09kJvxBqlGRfbTRRHw4hFpKP0sJqsfYvIuUfrJZQ=";
in
stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version;

  src = fetchzip {
    url = "https://github.com/junyu-w/corgi/releases/download/v${version}/corgi_v${version}_linux_64-bit.tar.gz";
    sha256 = hash;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 corgi -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/junyu-w/corgi/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "Corgi is a command-line workflow manager that helps with your repetitive command usages by organizing them into reusable snippet";
    homepage = "https://github.com/junyu-w/corgi";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "corgi";
    platforms = platforms.linux;
  };
}
