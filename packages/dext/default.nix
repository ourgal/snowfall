{
  lib,
  stdenv,
  pkgs,
  namespace,
}:
let
  pname = "dext";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname src version;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D dext $out/bin/dext
    runHook postInstall
  '';

  meta = with lib; {
    description = "Sort files into directories based on file extensions";
    homepage = "https://github.com/AfzGit/dext";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "dext";
    platforms = platforms.all;
  };
}