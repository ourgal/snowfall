{
  lib,
  stdenv,
  python3,
  _sources',
}:
stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  dontBuild = true;

  postPatch = ''
    chmod +x aniweather.py
    patchShebangs aniweather.py
  '';

  installPhase = ''
    runHook preInstall
    install -m755 -D aniweather.py $out/bin/aniweather
    runHook postInstall
  '';

  nativeBuildInputs = [ (python3.withPackages (ps: [ ps.requests ])) ];

  meta = {
    description = "Aniweather is a simple console weather app featuring cute ASCII art of an anime girl";
    homepage = "https://github.com/kaishira/aniweather";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "aniweather";
    platforms = lib.platforms.all;
  };
}
