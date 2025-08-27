{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-hgj+VYapFboJ/DIIh9lWFKhu9VFFwiLELfDPtZm6HeU=";

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
)
