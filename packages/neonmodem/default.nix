{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-zqQtuyFrsDB1xRdl4cbaTsCawMrBvcu78zXgU2jUwHI=";

    ldflags = [
      "-s"
      "-w"
    ];

    meta = with lib; {
      description = "Neon Modem Overdrive";
      homepage = "https://github.com/mrusme/neonmodem";
      license = licenses.gpl3Only;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "neonmodem";
    };
  }
)
