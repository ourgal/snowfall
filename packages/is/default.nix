{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
let
  source = _sources' ./.;
in
buildGoModule (
  lib.${namespace}.mkGoSource source
  // {
    vendorHash = "sha256-P2O+wyK+t3rACS+t6GTebNbGmKFBPACirbmm3EavPxw=";

    ldflags = [
      "-s"
      "-w"
    ];

    doCheck = false;

    meta = {
      description = "An inspector for your environment";
      homepage = "https://github.com/oalders/is";
      changelog = "https://github.com/oalders/is/blob/${source.src.rev}/CHANGELOG.md";
      license = with lib.licenses; [
        asl20
        mit
      ];
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "is";
    };
  }
)
