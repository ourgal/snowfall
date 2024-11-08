{
  lib,
  buildGoModule,
  _sources,
}:
buildGoModule {
  inherit (_sources.mdtt) pname version src;

  vendorHash = "sha256-sEdDfQnBaqQ/pBubYT0sWMaC3tyi0g/dIfUsrHYrA+Q=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Markdown Table Editor TUI";
    homepage = "https://github.com/szktkfm/mdtt";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "mdtt";
  };
}
