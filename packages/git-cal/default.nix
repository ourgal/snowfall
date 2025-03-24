{
  lib,
  stdenv,
  perl,
  _sources',
}:
stdenv.mkDerivation {
  inherit (_sources' ./.) pname src version;

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
