{
  lib,
  stdenv,
  _sources,
}:
stdenv.mkDerivation rec {
  inherit (_sources.rustywatch) pname version src;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 rustywatch -t $out/bin
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
