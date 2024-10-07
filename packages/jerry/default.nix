{
  lib,
  stdenv,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "jerry";
  source = lib.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit pname;
  version = "unstable-${source.date}";

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
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
