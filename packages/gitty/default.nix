{
  lib,
  buildGoModule,
  installShellFiles,
  _sources,
}:
buildGoModule {
  inherit (_sources.gitty) pname src version;

  vendorHash = "sha256-PA2K+qaCRiy4iTu1ZD+kbMb/ttAF3hgVUtBjcAMnRrI=";

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
