{
  lib,
  buildGoModule,
  pkgs,
  namespace,
}:
let
  pname = "bt";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname version src;

  vendorHash = "sha256-3GUK1hOUT0jeI8POrlxEhlXFHw0uYZXtxfhA2hJIsKY=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Interactive tree-like terminal file manager";
    homepage = "https://github.com/LeperGnome/bt";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "bt";
  };
}
