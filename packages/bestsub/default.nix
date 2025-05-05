{
  lib,
  buildGoModule,
  _sources',
}:

buildGoModule {
  inherit (_sources' ./.) pname version src;

  vendorHash = "sha256-tw+yFtceHC45/396aJioqAF+epDJTYfwLzOh2M0wq+c=";

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
