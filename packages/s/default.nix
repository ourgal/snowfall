{
  lib,
  buildGoModule,
  fetchFromGitHub,
  installShellFiles,
}:

buildGoModule rec {
  pname = "s";
  version = "0.7.1";

  src = fetchFromGitHub {
    owner = "zquestz";
    repo = "s";
    rev = "v${version}";
    hash = "sha256-cu2XGA5rRO+cHZ9QkJvMBjbxNZigxsx12ziCJG1LCQs=";
  };

  vendorHash = "sha256-0E/9fONanSxb2Tv5wKIpf1J/A6Hdge23xy3r6pFyV9E=";

  ldflags = [
    "-s"
    "-w"
  ];

  nativeBuildInputs = [ installShellFiles ];

  postInstall = ''
    $out/bin/s --completion bash > s.bash
    $out/bin/s --completion zsh > s.zsh
    $out/bin/s --completion fish > s.fish
    installShellCompletion s.{bash,fish,zsh}
  '';

  meta = with lib; {
    description = "Open a web search in your terminal";
    homepage = "https://github.com/zquestz/s";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "s";
  };
}
