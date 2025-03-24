{
  lib,
  buildGoModule,
  _sources',
}:
buildGoModule {
  inherit (_sources' ./.) pname src version;

  vendorHash = "sha256-TVWOCgQCBCveUbTW04ZKsrG51vup7J7NTU0+790v3Dk=";

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
