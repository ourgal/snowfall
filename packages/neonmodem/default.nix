{
  lib,
  buildGoModule,
  _sources',
}:
buildGoModule {
  inherit (_sources' ./.) pname version src;

  vendorHash = "sha256-pESNARoUgfg5/cTlTvKF3i7dTMIu0gRG/oV4Ov6h2cY=";

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
