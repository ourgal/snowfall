{
  lib,
  buildGoModule,
  fetchFromGitHub,
  installShellFiles,
  namespace,
}:
let
  pname = "gogitmoji";
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

  vendorHash = "sha256-OjYhqYscuybA3BiaoJMdVQpV+m1MLFDZC+F6xB2+g4Y=";

  ldflags = [
    "-s"
    "-w"
  ];

  nativeBuildInputs = [ installShellFiles ];

  doCheck = false;

  postInstall = ''
    installShellCompletion --cmd gogitmoji \
      --bash <($out/bin/gogitmoji completion bash) \
      --fish <($out/bin/gogitmoji completion fish) \
      --zsh <($out/bin/gogitmoji completion zsh)
  '';

  meta = with lib; {
    description = "Gitmoji commit message helper written in Go";
    homepage = "https://github.com/jamesdobson/gogitmoji";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gogitmoji";
  };
}
