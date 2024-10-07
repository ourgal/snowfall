{
  stdenv,
  fetchFromGitHub,
  namespace,
  lib,
}:
let
  pname = "c";
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
