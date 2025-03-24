{
  lib,
  stdenv,
  python3,
  socat,
  _sources',
}:
stdenv.mkDerivation {
  inherit (_sources' ./.) pname src version;

  dontBuild = true;

  buildInputs = [
    socat
    (python3.withPackages (ps: [
      ps.requests
      ps.pypresence
    ]))
  ];

  installPhase = ''
    runHook preInstall
    install -m755 -D curd.py $out/bin/curd
    runHook postInstall
  '';

  meta = with lib; {
    description = "Watch anime in cli with Anilist Integration and Discord RPC";
    homepage = "https://github.com/Wraient/curd";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "curd";
    platforms = platforms.all;
  };
}
