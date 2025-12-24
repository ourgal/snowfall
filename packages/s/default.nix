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
    vendorHash = "sha256-GEpBdCByMrCR7doDvp/eVKQzH8Z2kCqetwFivkkUDVU=";

    ldflags = [
      "-s"
      "-w"
    ];

    nativeBuildInputs = [ installShellFiles ];

    postInstall = ''
      installShellCompletion --cmd s \
        --bash <($out/bin/s --completion bash) \
        --fish <($out/bin/s --completion fish) \
        --zsh <($out/bin/s --completion zsh)
    '';

    meta = with lib; {
      description = "Open a web search in your terminal";
      homepage = "https://github.com/zquestz/s";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "s";
    };
  }
)
