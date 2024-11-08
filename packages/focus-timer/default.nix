{
  lib,
  buildGoModule,
  alsa-lib,
  pkg-config,
  _sources,
}:
buildGoModule rec {
  inherit (_sources.focus) pname src version;

  vendorHash = "sha256-wWTDo4zbvQjosI+fsBwEq5wKhJX2gw9VAbih1urRTO8=";

  ldflags = [
    "-s"
    "-w"
  ];

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ alsa-lib ];

  doCheck = false;

  meta = with lib; {
    description = "A fully featured productivity timer for the command line, based on the Pomodoro Technique. Supports Linux, Windows, and macOS";
    homepage = "https://github.com/ayoisaiah/focus";
    changelog = "https://github.com/ayoisaiah/focus/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "focus";
  };
}
