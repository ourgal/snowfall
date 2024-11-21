{
  lib,
  stdenv,
  fetchzip,
  installShellFiles,
  writeShellScriptBin,
  curl,
  jq,
  gnused,
  _sources,
}:
let
  hash = "wb4SsOKjSBuykE32l0WUTEOyR97neZUptC5nqe9YIYk=";
in
stdenv.mkDerivation rec {
  inherit (_sources.av) pname version;

  src = fetchzip {
    url = "https://github.com/aviator-co/av/releases/download/v${version}/av_${version}_linux_arm64.tar.gz";
    sha256 = hash;
    stripRoot = false;
  };

  nativeBuildInputs = [ installShellFiles ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 av -t $out/bin
    installManPage man/*/*
    runHook postInstall
  '';

  passthru.update = writeShellScriptBin "update-package" ''
    set -euo pipefail

    latest="$(${curl}/bin/curl -s "https://api.github.com/repos/aviator-co/av/releases?per_page=1" | ${jq}/bin/jq -r ".[0].tag_name" | ${gnused}/bin/sed 's/^v//')"

    drift rewrite --auto-hash --new-version "$latest"
  '';

  meta = with lib; {
    description = "A command line tool to manage stacked PRs with Aviator";
    homepage = "https://github.com/aviator-co/av";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "av";
  };
}
