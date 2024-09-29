{
  lib,
  buildGoModule,
  fetchFromGitHub,
  installShellFiles,
}:

buildGoModule rec {
  pname = "gitty";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "worlpaker";
    repo = "gitty";
    rev = "v${version}";
    hash = "sha256-+jKMp13EVbsJ67Uklg/XjULbHTpscfLSfRTjhjzKnHw=";
  };

  vendorHash = "sha256-jaJwsFhZzUEz8pG8frkOviNdqgPvvJBFLBsr7BVHNlY=";

  ldflags = [
    "-s"
    "-w"
  ];

  nativeBuildInputs = [ installShellFiles ];

  postInstall = ''
    $out/bin/gitty completion bash > gitty.bash
    $out/bin/gitty completion zsh > gitty.zsh
    $out/bin/gitty completion fish > gitty.fish
    installShellCompletion gitty.{bash,fish,zsh}
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
