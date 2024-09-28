{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "rat";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "ericfreese";
    repo = "rat";
    rev = "v${version}";
    hash = "sha256-/DAK2lc/4Vh1+fJa6blUBdoWWrnftBy9lcR7xx48WQM=";
  };

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
