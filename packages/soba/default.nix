{
  lib,
  buildGoModule,
  _sources,
}:
buildGoModule rec {
  inherit (_sources.soba) pname version src;

  vendorHash = "sha256-julsw0L65/lKE0YyKV6PJg8D7PRnfyPKHqM0yXWk07Q=";

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
