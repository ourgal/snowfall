{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-85bDIAb6u3h0wK7OnRDiecbFS1Td3Iotx/thHzeAkRo=";

    ldflags = [
      "-s"
      "-w"
    ];

    meta = with lib; {
      description = "Limit the rate at which a command can fire";
      homepage = "https://github.com/oalders/debounce";
      changelog = "https://github.com/oalders/debounce/blob/${src.rev}/CHANGELOG.md";
      license = with licenses; [
        asl20
        mit
      ];
      maintainers = with maintainers; [ zxc ];
      mainProgram = "debounce";
    };
  }
)
