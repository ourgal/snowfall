{
  lib,
  stdenv,
  _sources,
}:
stdenv.mkDerivation {
  inherit (_sources.comigo) pname version src;

  sourceRoot = ".";

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 comi -t $out/bin
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
