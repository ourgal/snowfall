{
  lib,
  buildGoModule,
  pkgs,
  namespace,
}:
let
  pname = "proji";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname src version;

  vendorHash = "sha256-YfaMSqwdD1t47MwJkuA91scu1QREb6srX5IcBdDSK1o=";

  ldflags = [
    "-s"
    "-w"
  ];

  doCheck = false;

  meta = with lib; {
    description = "A powerful cross-platform project templating tool";
    homepage = "https://github.com/proji-rocks/proji";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "proji";
  };
}