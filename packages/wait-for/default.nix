{
  lib,
  stdenv,
  _sources,
}:

stdenv.mkDerivation rec {
  inherit (_sources.wait-for) pname version src;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 wait-for -t $out/bin
    runHook postInstall
  '';

  meta = with lib; {
    description = "Wait-for is a script to wait for another service to become available";
    homepage = "https://github.com/eficode/wait-for";
    changelog = "https://github.com/eficode/wait-for/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "wait-for";
    platforms = platforms.all;
  };
}
