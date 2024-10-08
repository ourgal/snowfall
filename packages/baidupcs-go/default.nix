{
  lib,
  buildGoModule,
  namespace,
  pkgs,
}:
let
  pname = "baidupcs-go";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname src version;

  vendorHash = "sha256-msTlXtidxLTe3xjxTOWCqx/epFT0XPdwGPantDJUGpc=";

  ldflags = [
    "-s"
    "-w"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Iikira/BaiduPCS-Go原版基础上集成了分享链接/秒传链接转存功能";
    homepage = "https://github.com/qjfoidnh/BaiduPCS-Go";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "baidu-pcs-go";
  };
}
