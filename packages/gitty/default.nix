{
  lib,
  buildGoModule,
  fetchFromGitHub,
  installShellFiles,
  namespace,
}:
let
  pname = "gitty";
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

  vendorHash = "sha256-jaJwsFhZzUEz8pG8frkOviNdqgPvvJBFLBsr7BVHNlY=";

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
