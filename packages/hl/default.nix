{
  lib,
  fetchzip,
  stdenv,
  namespace,
}:
let
  pname = "hl";
  source = lib.${namespace}.sources.${pname};
in
stdenv.mkDerivation rec {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchzip {
    url = "https://github.com/pamburus/hl/releases/download/v${version}/hl-linux-x86_64-gnu.tar.gz";
    hash = "sha256-eILAte4fw0FjghJBSoj9bT1DxWJhWRx2oarzaUTZyYU=";
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D hl $out/bin/hl
    runHook postInstall
  '';

  meta = with lib; {
    description = "A fast and powerful log viewer and processor that translates JSON or logfmt logs into a pretty human-readable format";
    homepage = "https://github.com/pamburus/hl";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "hl";
  };
}
