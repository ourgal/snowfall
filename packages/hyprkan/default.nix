{
  lib,
  stdenv,
  python3,
  _sources',
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname src version;

  installPhase = ''
    runHook preInstall
    install -m755 -D src/hyprkan.py $out/bin/hyprkan
    patchShebangs $out/bin/hyprkan
    runHook postInstall
  '';

  nativeBuildInputs = [ (python3.withPackages (ps: [ ps.xlib ])) ];

  meta = {
    description = "App-aware Kanata layer switcher for Linux";
    homepage = "https://github.com/mdSlash/hyprkan";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "hyprkan";
    platforms = lib.platforms.all;
  };
}
