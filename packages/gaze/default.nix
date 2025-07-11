{
  lib,
  buildGoModule,
  ruby,
  python3,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
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
)
