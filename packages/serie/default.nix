{
  lib,
  stdenv,
  fetchzip,
  namespace,
  pkgs,
}:
let
  pname = "serie";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation rec {
  inherit (source) pname version;

  src = fetchzip {
    url = "https://github.com/lusingander/serie/releases/download/v${version}/serie-${version}-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-Phj+DJbB8x3UOKNFQOfejbdtAj9Fnj+ROAe4imPs/Rw=";
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D serie $out/bin/serie
    runHook postInstall
  '';

  meta = with lib; {
    description = "A rich git commit graph in your terminal, like magic";
    homepage = "https://github.com/lusingander/serie";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "serie";
  };
}
