{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "dblab";
  version = "0.26.0";

  src = fetchFromGitHub {
    owner = "danvergara";
    repo = "dblab";
    rev = "v${version}";
    hash = "sha256-3v9L1mV+DZ6FlrBoGSg8tewKJVyeqqacVj3yGVtYVHc=";
  };

  vendorHash = "sha256-3vtk4pJE/zRLCbIN+UFvxF/KdH4J5IiCsQ0Wu585wnM=";

  ldflags = [
    "-s"
    "-w"
  ];

  doCheck = false;

  meta = with lib; {
    description = "The database client every command line junkie deserves";
    homepage = "https://github.com/danvergara/dblab";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "dblab";
  };
}
