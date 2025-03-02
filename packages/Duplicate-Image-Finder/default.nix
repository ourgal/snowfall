{
  lib,
  stdenv,
  python3,
  _sources,
}:

stdenv.mkDerivation {
  inherit (_sources.duplicate-image-finder) pname version src;

  postPatch = ''
    chmod +x difPy/dif.py
    sed -i '1 i #!/usr/bin/env python' difPy/dif.py
  '';

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D difPy/dif.py $out/bin/dif.py
    patchShebangs $out/bin/dif.py
    runHook postInstall
  '';

  nativeBuildInputs = [
    (python3.withPackages (ps: [
      ps.numpy
      ps.pillow
    ]))
  ];

  meta = {
    description = "DifPy - Python package for finding duplicate and similar images";
    homepage = "https://github.com/elisemercury/Duplicate-Image-Finder";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "dif.py";
    platforms = lib.platforms.all;
  };
}
