{
  lib,
  buildGoModule,
  namespace,
  pkgs,
}:
let
  pname = "treegen";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname version src;

  vendorHash = null;

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "ASCII Tree to Directory and File Structure Generator";
    homepage = "https://github.com/bilbilak/treegen";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "treegen";
  };
}
