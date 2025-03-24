{
  lib,
  buildGoModule,
  _sources',
}:
buildGoModule {
  inherit (_sources' ./.) pname version src;

  vendorHash = "sha256-rpK8mLn3ss6LyjCK84CsT1y3jvBJtk2AlWSFT8cjKGE=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Compose shell commands to build interactive terminal applications";
    homepage = "https://github.com/ericfreese/rat";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "rat";
  };
}
