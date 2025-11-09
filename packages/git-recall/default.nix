{
  lib,
  stdenv,
  _sources',
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname src version;

  installPhase = ''
    runHook preInstall
    install -Dm755 git-recall -t $out/bin
    runHook postInstall
  '';

  meta = {
    description = "An interactive way to peruse your git history from the terminal";
    homepage = "https://github.com/Fakerr/git-recall";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "git-recall";
    platforms = lib.platforms.all;
  };
}
