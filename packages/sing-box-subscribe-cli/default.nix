{
  lib,
  namespace,
  _sources',
  buildGoModule,
  nix-update-script,
}:

buildGoModule (
  finalAttrs:
  (
    lib.${namespace}.mkGoSource (_sources' ./.)
    // {
      vendorHash = "sha256-komX1AmHt2NoF1x6xsNa2RFkfVzOXfYEMPhT0zwMxjw=";

      ldflags = [
        "-s"
        "-w"
        "-X=main.version=${finalAttrs.src.rev}"
      ];

      postInstall = "mv $out/bin/{sing-box-subscribe-cli,sing-box-sub}";

      passthru.updateScript = nix-update-script { };

      meta = {
        description = "Pure Go CLI for generating sing-box config.json from subscriptions and templates. 纯 Go sing-box 订阅转换 CLI：从订阅 URL/本地文件和 JSON 模板生成 config.json";
        homepage = "https://github.com/rainbend/sing-box-subscribe-cli";
        changelog = "https://github.com/rainbend/sing-box-subscribe-cli/releases/tag/${finalAttrs.src.tag}";
        license = lib.licenses.asl20;
        maintainers = with lib.maintainers; [ zxc ];
        mainProgram = "sing-box-sub";
      };
    }
  )
)
