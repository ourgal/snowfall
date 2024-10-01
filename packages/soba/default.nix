{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "soba";
  version = "1.2.19";

  src = fetchFromGitHub {
    owner = "jonhadfield";
    repo = "soba";
    rev = version;
    hash = "sha256-Jsmn/H4b0hU6vIg5uGS20SHC/SP7ULMfjmrq8MY25Bo=";
  };

  vendorHash = "sha256-FaziC06K8agJHKIm2iKcuLcWHExD4eKr/BF0+9ItmYU=";

  ldflags = [
    "-s"
    "-w"
    "-X=main.version=${version}"
    "-X=main.sha=${src.rev}"
    "-X=main.buildDate=1970-01-01T00:00:00Z"
    "-X=main.tag=${src.rev}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Backup github, gitlab, bitbucket, azure devops, and gitea repositories";
    homepage = "https://github.com/jonhadfield/soba";
    changelog = "https://github.com/jonhadfield/soba/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "soba";
  };
}
