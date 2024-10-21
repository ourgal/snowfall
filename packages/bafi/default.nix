{
  lib,
  buildGoModule,
  pkgs,
  namespace,
}:
let
  pname = "bafi";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname src version;

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
