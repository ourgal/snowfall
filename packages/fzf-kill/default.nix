{
  lib,
  stdenv,
  namespace,
  pkgs,
}:
let
  pname = "fzf-kill";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname src version;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D ./fzf-kill $out/bin/fzf-kill
    runHook postInstall
  '';

  meta = with lib; {
    description = "The no-nonsense task killer for your terminal";
    homepage = "https://github.com/Zeioth/fzf-kill";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "fzf-kill";
    platforms = platforms.all;
  };
}
