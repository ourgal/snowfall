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
  hash = "HHqQnUXkaDOjWZ2AwZnndGKl/ZuJxzz5N2mVeL5KKPg=";
in
stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version;

  src = fetchzip {
    url = "https://github.com/tmrts/boilr/releases/download/${version}/boilr-${version}-linux_amd64.tgz";
    sha256 = hash;
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 boilr -t $out/bin
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/tmrts/boilr/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "Zap: boilerplate template manager that generates files or directories from template repositories";
    homepage = "https://github.com/tmrts/boilr";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "boilr";
    platforms = platforms.all;
  };
}
