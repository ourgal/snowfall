{
  lib,
  buildGoModule,
  installShellFiles,
  _sources,
}:
buildGoModule rec {
  inherit (_sources.goji) pname version src;

  vendorHash = "sha256-qgFpC559JN+BneAcgrOE7WSXO2cG32+eu8sjk5P5EFI=";

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/muandane/goji/cmd.version=${version}"
  ];

  nativeBuildInputs = [ installShellFiles ];

  doCheck = false;

  postInstall = ''
    installShellCompletion --cmd goji \
      --bash <($out/bin/goji completion bash) \
      --fish <($out/bin/goji completion fish) \
      --zsh <($out/bin/goji completion zsh)
  '';

  meta = with lib; {
    description = "Commitizen-like Emoji Commit Tool written in Go (think cz-emoji and other commitizen adapters but in go";
    homepage = "https://github.com/muandane/goji";
    changelog = "https://github.com/muandane/goji/blob/${src.rev}/CHANGELOG.md";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "goji";
  };
}
