{
  lib,
  stdenv,
  fetchFromGitHub,
  python3,
  socat,
}:

stdenv.mkDerivation {
  pname = "curd";
  version = "unstable-2024-09-25";

  src = fetchFromGitHub {
    owner = "Wraient";
    repo = "curd";
    rev = "a719d64a39c552e6497b3f962450092edcfe9a00";
    hash = "sha256-yqLS2Z7OO/x5X2oP2+nslVIw18/c+1zeaCXa4dVqp6o=";
  };

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
