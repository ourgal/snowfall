{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "fzf-kill";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "Zeioth";
    repo = "fzf-kill";
    rev = "v${version}";
    hash = "sha256-Aa+jqcavFber+tAWUqPgV87sKKZS+5rGeJLS7RoYGLA=";
  };

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
