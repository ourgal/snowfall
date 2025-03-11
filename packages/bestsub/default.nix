{
  lib,
  buildGoModule,
  _sources,
}:

buildGoModule {
  inherit (_sources.bestsub) pname version src;

  vendorHash = "sha256-/GqqMnxENZi9qvIEF3QVO/mGjKr22Q6R3duVz+6e3es=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = {
    description = "订阅转换合并，节点可用性，测速，重命名，导出为mihomo/clash订阅工具";
    homepage = "https://github.com/bestruirui/BestSub";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "bestsub";
    platforms = lib.platforms.all;
  };
}
