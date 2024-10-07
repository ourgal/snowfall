{
  lib,
  stdenv,
  fetchFromGitHub,
  perl,
  namespace,
}:
let
  pname = "git-cal";
  source = lib.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  dontBuild = true;

  buildInputs = [ perl ];

  installPhase = ''
    runHook preInstall
    install -m755 -D git-cal $out/bin/git-cal
    runHook postInstall
  '';

  meta = with lib; {
    description = "Github like contributions calendar on terminal";
    homepage = "https://github.com/k4rthik/git-cal";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-cal";
    platforms = platforms.all;
  };
}
