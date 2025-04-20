{
  lib,
  buildGoModule,
  _sources',
}:

buildGoModule rec {
  inherit (_sources' ./.) pname version src;

  vendorHash = "sha256-SdGko6KnkbUcEGt811YQXQF9ii7LpPlCg8+iSvIR8Fk=";

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
