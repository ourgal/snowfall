{
  lib,
  buildGoModule,
  _sources,
}:
buildGoModule {
  inherit (_sources.config-file-validator) pname src version;

  vendorHash = "sha256-GybtH7P1Y/j7MrmokjpzqVdb/Vry+hzlKWorjdjuxUc=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Cross Platform tool to validate configuration files";
    homepage = "https://github.com/Boeing/config-file-validator";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "validator";
  };
}
