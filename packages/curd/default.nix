{
  lib,
  stdenv,
  fetchFromGitHub,
  python3,
  socat,
  namespace,
}:
let
  pname = "curd";
  source = lib.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit pname;
  version = "unstable-${source.date}";

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
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
