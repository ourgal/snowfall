{
  lib,
  stdenv,
  _sources,
}:

stdenv.mkDerivation rec {
  inherit (_sources.mdsf) pname version src;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 mdsf -t $out/bin
    runHook postInstall
  '';

  meta = with lib; {
    description = "Format markdown code blocks using your favorite code formatters";
    homepage = "https://github.com/hougesen/mdsf";
    changelog = "https://github.com/hougesen/mdsf/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "mdsf";
    platforms = platforms.x86_64;
  };
}
