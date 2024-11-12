{
  lib,
  buildGoModule,
  _sources,
}:
buildGoModule {
  inherit (_sources.sonicradio) pname version src;

  vendorHash = "sha256-NKbYd155A32B5TK9WpV9uFVNx3zC0LDccwlUOsf4+NU=";

  ldflags = [
    "-s"
    "-w"
  ];

  doCheck = false;

  meta = with lib; {
    description = "A TUI radio player making use of Radio Browser API and Bubbletea";
    homepage = "https://github.com/dancnb/sonicradio";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "sonicradio";
  };
}
