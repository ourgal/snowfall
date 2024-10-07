{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "dblab";
  source = lib.${namespace}.sources.${pname};
in
buildGoModule {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
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
