{
  lib,
  buildGoModule,
  fetchFromGitHub,
  alsa-lib,
  pkg-config,
}:

buildGoModule rec {
  pname = "focus";
  version = "1.4.3";

  src = fetchFromGitHub {
    owner = "ayoisaiah";
    repo = "focus";
    rev = "v${version}";
    hash = "sha256-p9gTFUYHdyOY2EFT/ZmBHT7dRNm64s/3ExUXG7bfQ70=";
  };

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
