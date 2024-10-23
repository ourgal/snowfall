{
  lib,
  buildGoModule,
  pkgs,
  namespace,
}:

let
  pname = "config-file-validator";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname src version;

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
