{
  stdenv,
  lib,
  _sources,
}:
stdenv.mkDerivation {
  inherit (_sources.c) pname src version;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D c $out/bin/c
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
