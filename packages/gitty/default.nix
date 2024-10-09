{
  lib,
  buildGoModule,
  installShellFiles,
  namespace,
  pkgs,
}:
let
  pname = "gitty";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname src version;

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
