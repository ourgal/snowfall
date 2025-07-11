{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-SxivHDLYE7MDHbAOGatvPJ5cFQsZ52mxqTKyPpK3XCk=";

    ldflags = [
      "-s"
      "-w"
    ];

    doCheck = false;

    meta = with lib; {
      description = "A TUI radio player making use of Radio Browser API and Bubbletea";
      homepage = "https://github.com/dancnb/sonicradio";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "sonicradio";
    };
  }
)
