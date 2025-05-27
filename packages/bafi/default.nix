{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-t7rkEAXXK1e124wyN+qUTGoH0r0X/ZV49/XG29k/KVM=";

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
