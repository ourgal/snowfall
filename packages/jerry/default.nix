{
  lib,
  stdenv,
  fetchFromGitHub,
  ...
}:

stdenv.mkDerivation {
  pname = "jerry";
  version = "unstable-2024-08-14";

  src = fetchFromGitHub {
    owner = "justchokingaround";
    repo = "jerry";
    rev = "5ba8beccec4f53cf87b0bef6116de27b69e86924";
    sha256 = "18qwyvph4vvchjq22kg32fxq0zs03rdwlsiydnmwpvlwyj0632cw";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D ./jerry.sh $out/bin/jerry
    runHook postInstall
  '';

  meta = with lib; {
    description = "Watch anime with automatic anilist syncing and other cool stuff";
    homepage = "https://github.com/justchokingaround/jerry";
    license = licenses.gpl3;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "jerry";
    platforms = platforms.all;
  };
}
