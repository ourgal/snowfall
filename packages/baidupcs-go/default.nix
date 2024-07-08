{
  stdenv,
  lib,
  fetchzip,
  ...
}:

stdenv.mkDerivation rec {
  pname = "baidupcs-go";
  version = "3.9.5";

  src = fetchzip {
    url = "https://github.com/qjfoidnh/BaiduPCS-Go/releases/download/v${version}/BaiduPCS-Go-v${version}-linux-amd64.zip";
    hash = "sha256-ctLbvW93rHyFOY5M1Wmz0ZtIk+ZGtdCna3FaovWs31k=";
  };

  installPhase = ''
    runHook preInstall
    install -m755 -D BaiduPCS-Go $out/bin/baidupcs
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/qjfoidnh/BaiduPCS-Go";
    description = "iikira/BaiduPCS-Go原版基础上集成了分享链接/秒传链接转存功能";
    platforms = platforms.linux;
  };
}
