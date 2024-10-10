{
  lib,
  stdenv,
  pkgs,
  namespace,
}:
let
  pname = "shipit";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname version src;

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
