{
  lib,
  buildGoModule,
  _sources',
}:

buildGoModule rec {
  inherit (_sources' ./.) pname version src;

  vendorHash = "sha256-dne3z0JrPaw+YJ0TOzjdfhrSX0ExYslOv0BhyjXOxzc=";

  ldflags = [
    "-s"
    "-w"
  ];

  doCheck = false;

  meta = {
    description = "An inspector for your environment";
    homepage = "https://github.com/oalders/is";
    changelog = "https://github.com/oalders/is/blob/${src.rev}/CHANGELOG.md";
    license = with lib.licenses; [
      asl20
      mit
    ];
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "is";
  };
}
