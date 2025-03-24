{
  lib,
  buildGoModule,
  _sources',
}:
buildGoModule rec {
  inherit (_sources' ./.) pname version src;

  vendorHash = "sha256-+RMmbKCY9Q8w58ksK7PgtM2mo5bOc6HJFJsfdWIYDnE=";

  ldflags = [
    "s"
    "-w"
    "-X=github.com/pomdtr/sunbeam/internal/cli.Version=${version}"
  ];

  meta = with lib; {
    description = "Command-line launcher";
    homepage = "https://github.com/pomdtr/sunbeam";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "sunbeam";
  };
}
