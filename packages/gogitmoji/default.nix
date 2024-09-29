{
  lib,
  buildGoModule,
  fetchFromGitHub,
  installShellFiles,
}:

buildGoModule rec {
  pname = "gogitmoji";
  version = "1.1.5";

  src = fetchFromGitHub {
    owner = "jamesdobson";
    repo = "gogitmoji";
    rev = "v${version}";
    hash = "sha256-mXJga9Y1ZA7htzCEyMIuyj2oMjyFOj/Z/2U/yzLfQPw=";
  };

  vendorHash = "sha256-OjYhqYscuybA3BiaoJMdVQpV+m1MLFDZC+F6xB2+g4Y=";

  ldflags = [
    "-s"
    "-w"
  ];

  nativeBuildInputs = [ installShellFiles ];

  doCheck = false;

  postInstall = ''
    $out/bin/gogitmoji completion bash > gogitmoji.bash
    $out/bin/gogitmoji completion zsh > gogitmoji.zsh
    $out/bin/gogitmoji completion fish > gogitmoji.fish
    installShellCompletion gogitmoji.{bash,fish,zsh}
  '';

  meta = with lib; {
    description = "Gitmoji commit message helper written in Go";
    homepage = "https://github.com/jamesdobson/gogitmoji";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gogitmoji";
  };
}
