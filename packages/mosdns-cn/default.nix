{ stdenv, fetchzip, ... }:

stdenv.mkDerivation rec {
  pname = "mosdns-cn";
  version = "1.4.0";

  src = fetchzip {
    url = "https://github.com/IrineSistiana/mosdns-cn/releases/download/v${version}/mosdns-cn-linux-amd64.zip";
    hash = "sha256-M4syjEBET8ZmGx4dPanyE82w72I8GLxLsDzNLKKNeGo=";
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D ./mosdns-cn $out/bin/mosdns-cn
    runHook postInstall
  '';
}
