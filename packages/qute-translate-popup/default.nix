{
  lib,
  stdenv,
  _sources,
  python3,
}:

stdenv.mkDerivation {
  inherit (_sources.qute-translate-popup) pname version src;

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -m755 -D translate $out/bin/translate
    patchShebangs $out/bin/translate

    runHook postInstall
  '';

  nativeBuildInputs = [ (python3.withPackages (ps: [ ps.requests ])) ];

  meta = {
    description = "Qutebrowser userscript for selected text translation. with a qute popup";
    homepage = "https://github.com/l4l4l4l4/qute-translate-popup";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "qute-translate-popup";
    platforms = lib.platforms.all;
  };
}
