{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
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
)
