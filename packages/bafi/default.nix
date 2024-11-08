{
  lib,
  buildGoModule,
  _sources,
}:
buildGoModule {
  inherit (_sources.bafi) pname src version;

  vendorHash = "sha256-Gn0uwB8iFH+WeHT/kMbWaHuprIPncPj0p9bkEXeoRxQ=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Universal JSON, BSON, YAML, CSV, XML, mt940 converter with templates";
    homepage = "https://github.com/mmalcek/bafi";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "bafi";
  };
}
