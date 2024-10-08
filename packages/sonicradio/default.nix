{
  lib,
  buildGoModule,
  namespace,
  pkgs,
}:
let
  pname = "sonicradio";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname version src;

  vendorHash = "sha256-m4QIGiuk8SbuwLI+Lp+NHgEZOvtwo7rbUiVmm7jwJ24=";

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
