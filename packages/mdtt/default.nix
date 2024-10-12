{
  lib,
  buildGoModule,
  pkgs,
  namespace,
}:
let
  pname = "mdtt";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname version src;

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
