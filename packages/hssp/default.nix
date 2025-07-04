{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-Bpu34alpZYyjI0ZQCDKk9WjG/vr3n/xmEaw41G8n/dc=";

    ldflags = [
      "-s"
      "-w"
    ];

    meta = with lib; {
      description = "CLI to avoid remembering the http status codes";
      homepage = "https://github.com/sterchelen/hssp";
      license = licenses.gpl3Only;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "hssp";
    };
  }
)
