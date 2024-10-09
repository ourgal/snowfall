{
  lib,
  buildGoModule,
  namespace,
  pkgs,
}:
let
  pname = "dblab";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname src version;

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
