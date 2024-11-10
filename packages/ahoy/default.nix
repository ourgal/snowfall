{
  lib,
  buildGoModule,
  _sources,
}:

buildGoModule rec {
  inherit (_sources.ahoy) pname version src;

  vendorHash = null;

  ldflags = [
    "-s"
    "-w"
    "-X=main.version=${src.rev}"
    "-X=main.GitCommit=${src.rev}"
    "-X=main.GitBranch=${src.rev}"
    "-X=main.BuildTime=1970-01-01T00:00:00Z"
  ];

  meta = with lib; {
    description = "Create self-documenting cli programs from YAML files. Easily wrap bash, grunt, npm, docker, (anything) to standardize your processes and make the lives of the people working on your project better";
    homepage = "https://github.com/ahoy-cli/ahoy";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "ahoy";
  };
}
