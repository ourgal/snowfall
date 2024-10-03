{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "sake";
  version = "0.15.1";

  src = fetchFromGitHub {
    owner = "alajmo";
    repo = "sake";
    rev = "v${version}";
    hash = "sha256-aTbom8J4S0ZCiHPfAPeFKZ+15PxG64dGqQtOKXuEBo8=";
  };

  vendorHash = "sha256-LSP/iTTHGJ/FS50YeKGMKkOOdSk435wCkwHPFiwTKC4=";

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/alajmo/sake/cmd.version=${version}"
    "-X=github.com/alajmo/sake/cmd.commit=${src.rev}"
    "-X=github.com/alajmo/sake/cmd.date=1970-01-01T00:00:00Z"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Robot: sake is a task runner for local and remote hosts";
    homepage = "https://github.com/alajmo/sake";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "sake";
  };
}
