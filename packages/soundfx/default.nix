{
  lib,
  stdenv,
  _sources',
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    cd soundfx.d
    install -Dm0644 *.mp3 -t $out
    runHook postInstall
  '';

  meta = {
    description = "Sound Effect Collection";
    homepage = "https://github.com/rse/soundfx";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
