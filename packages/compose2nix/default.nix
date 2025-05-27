{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-pJX73toLWacc1Tz7gbqOIN2CZOu4O2/Usv5lUtjxFRA=";

    ldflags = [
      "-s"
      "-w"
    ];

    meta = with lib; {
      description = "Generate a NixOS config from a Docker Compose project";
      homepage = "https://github.com/aksiksi/compose2nix";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "compose2nix";
    };
  }
)
