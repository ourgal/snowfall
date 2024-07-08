{
  stdenv,
  lib,
  fetchzip,
  ...
}:

stdenv.mkDerivation rec {
  pname = "s-search";
  version = "0.7.0";

  src = fetchzip {
    url = "https://github.com/zquestz/s/releases/download/v${version}/s-linux_386.zip";
    hash = "sha256-P3DPdRPFjDFI7ozfVqR4k0+jid0IJLWyG2/aGDP0AwY=";
  };

  installPhase = ''
    runHook preInstall
    install -m755 -D s $out/bin/s
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/zquestz/s";
    description = "Open a web search in your terminal. ";
    platforms = platforms.linux;
  };
}
