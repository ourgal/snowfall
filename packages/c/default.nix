{
  stdenv,
  namespace,
  lib,
  pkgs,
}:
let
  pname = "c";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname src version;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D ./c $out/bin/c
    runHook postInstall
  '';

  meta = with lib; {
    description = "Compile and execute C \"scripts\" in one go";
    homepage = "https://github.com/ryanmjacobs/c";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "c";
    platforms = platforms.all;
  };
}
