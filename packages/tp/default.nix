{
  lib,
  stdenv,
  fetchzip,
  namespace,
  pkgs,
}:
let
  pname = "tp";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation rec {
  inherit (source) pname version;

  src = fetchzip {
    url = "https://github.com/minefuto/tp/releases/download/v${version}/tp_Linux_x86_64.tar.gz";
    hash = "sha256-+ziOARrOL03AuMb9axU9BlPD+ZAp4XC1N0YAJLr0SfA=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall
    install -m755 -D tp $out/bin/tp
    runHook postInstall
  '';

  meta = with lib; {
    description = "Display the result of the commands at every keystroke";
    homepage = "https://github.com/minefuto/tp";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "tp";
  };
}
