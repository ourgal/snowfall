{
  lib,
  buildGoModule,
  _sources',
}:

buildGoModule {
  inherit (_sources' ./.) pname version src;

  vendorHash = "sha256-7yh1kS3XVyRxd0SKf7nFs1fT6XAtQ6nLdj/O9pzkiAo=";

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
