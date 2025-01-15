{
  lib,
  stdenv,
  python3,
  _sources,
}:
stdenv.mkDerivation {
  inherit (_sources.dlorg) pname src version;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D dlorg.py $out/bin/dlorg
    sed -i '1 i #!/usr/bin/env python' $out/bin/dlorg
    patchShebangs $out/bin/dlorg
    mkdir -p $out/etc/dlorg
    cp folder_config.json $out/etc/dlorg
    substituteInPlace $out/bin/dlorg \
      --replace-fail folder_config.json $out/etc/dlorg/folder_config.json
    runHook postInstall
  '';

  nativeBuildInputs = [ (python3.withPackages (ps: [ ps.rich ])) ];

  meta = with lib; {
    description = "";
    homepage = "https://github.com/deepspeccode/dlorg";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "dlorg";
    platforms = platforms.all;
  };
}
