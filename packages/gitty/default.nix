{
  lib,
  buildGoModule,
  installShellFiles,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-jMTA6SSm5cxBo5e4F0yykgy6KJdi/vs5McFXXZ1hC9Q=";

    ldflags = [
      "-s"
      "-w"
    ];

    nativeBuildInputs = [ installShellFiles ];

    postInstall = ''
      installShellCompletion --cmd gitty \
        --bash <($out/bin/gitty completion bash) \
        --fish <($out/bin/gitty completion fish) \
        --zsh <($out/bin/gitty completion zsh)
    '';

    doCheck = false;

    meta = with lib; {
      description = "Download GitHub File & Directory";
      homepage = "https://github.com/worlpaker/gitty";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "gitty";
    };
  }
)
