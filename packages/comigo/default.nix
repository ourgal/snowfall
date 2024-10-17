{
  lib,
  stdenv,
  fetchzip,
  pkgs,
  namespace,
}:
let
  pname = "comigo";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation rec {
  inherit (source) pname version;

  src = fetchzip {
    url = "https://github.com/yumenaka/comigo/releases/download/v${version}/comi_v0.9.11_Linux_x86_64.tar.gz";
    hash = "sha256-4M8bGLwGSrGjml9Q0QuSnxZ1BVuMm4OtDJlmfiye2Yo=";
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D comi $out/bin/comi
    runHook postInstall
  '';

  meta = with lib; {
    description = "Comigo：Comic & Manga Reader in Linux，Windows，Mac OS。简单的漫画阅读器，跨平台，支持各种压缩文件格式。わかりやすい漫画リーダー";
    homepage = "https://github.com/yumenaka/comigo";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "comi";
  };
}
