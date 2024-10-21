{
  lib,
  buildGoModule,
  pkgs,
  namespace,
  ruby,
  python3,
}:
let
  pname = "gaze";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname src version;

  vendorHash = "sha256-RdTA2HL/wKwqMIvm6gjsUTlaYklSRhyVhgJsGS9QRtY=";

  nativeBuildInputs = [
    ruby
    python3
  ];

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Executes commands for you";
    homepage = "https://github.com/wtetsu/gaze";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gaze";
  };
}
