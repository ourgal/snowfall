{
  lib,
  stdenv,
  _sources,
}:
stdenv.mkDerivation {
  inherit (_sources.shipit) pname version src;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D bin/shipit $out/bin/shipit
    runHook postInstall
  '';

  meta = with lib; {
    description = "Minimalistic SSH deployment";
    homepage = "https://github.com/sapegin/shipit";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "shipit";
    platforms = platforms.all;
  };
}
