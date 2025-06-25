{
  lib,
  buildGoModule,
  installShellFiles,
  _sources',
  namespace,
}:
let
  source = _sources' ./.;
in
buildGoModule (
  lib.${namespace}.mkGoSource source
  // {
    vendorHash = "sha256-vG6JcFCnfuQ6HMGBFL9zbLT3bWgKobIwExmgBnwsAnY=";

    ldflags = [
      "-s"
      "-w"
      "-X=github.com/muandane/goji/cmd.version=${source.version}"
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
      changelog = "https://github.com/muandane/goji/blob/${source.src.rev}/CHANGELOG.md";
      license = licenses.asl20;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "goji";
    };
  }
)
