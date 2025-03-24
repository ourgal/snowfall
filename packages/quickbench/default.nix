{
  lib,
  stdenv,
  _sources',
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  postPatch = "chmod +x ./quickbench";

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 quickbench -t $out/bin
    runHook postInstall
  '';

  meta = {
    description = "Quick Linux-based VM bench";
    homepage = "https://github.com/bearstech/quickbench";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "quickbench";
    platforms = lib.platforms.all;
  };
}
