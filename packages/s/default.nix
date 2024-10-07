{
  lib,
  buildGoModule,
  fetchFromGitHub,
  installShellFiles,
  namespace,
}:
let
  pname = "s";
  source = lib.${namespace}.sources.${pname};
in
buildGoModule {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  vendorHash = "sha256-0E/9fONanSxb2Tv5wKIpf1J/A6Hdge23xy3r6pFyV9E=";

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
