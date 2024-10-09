{
  lib,
  stdenv,
  namespace,
  pkgs,
}:
let
  pname = "gh-cp";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname src version;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D gh-cp $out/bin/gh-cp
    runHook postInstall
  '';

  meta = with lib; {
    description = "GitHub CLI extension to copy a file from a GitHub repository locally without cloning the repository";
    homepage = "https://github.com/mislav/gh-cp";
    license = licenses.unlicense;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gh-cp";
    platforms = platforms.all;
  };
}
