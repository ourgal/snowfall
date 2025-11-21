{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-p49l8d5AGi/nFoeVYh4zLD9LJplADiHWUPxbU9xYWgg=";

    ldflags = [
      "-s"
      "-w"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Universal JSON, BSON, YAML, CSV, XML, mt940 converter with templates";
      homepage = "https://github.com/mmalcek/bafi";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "bafi";
    };
  }
)
