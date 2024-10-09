{
  lib,
  stdenv,
  fetchzip,
  namespace,
  pkgs,
}:
let
  pname = "rustywatch";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation rec {
  inherit (source) pname version;

  src = fetchzip {
    url = "https://github.com/ak9024/rustywatch/releases/download/v${version}/rustywatch-${version}-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-4ZqsjzyZTv6gNIpLGkWS5i+WBFrnrOzvFSWTwuGrwRA=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D rustywatch $out/bin/rustywatch
    runHook postInstall
  '';

  meta = with lib; {
    description = "Live Reloading Built with Rust";
    homepage = "https://github.com/ak9024/rustywatch";
    changelog = "https://github.com/ak9024/rustywatch/blob/v${version}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "rustywatch";
  };
}
