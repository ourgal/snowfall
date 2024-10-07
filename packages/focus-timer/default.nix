{
  lib,
  buildGoModule,
  fetchFromGitHub,
  alsa-lib,
  pkg-config,
  namespace,
}:
let
  pname = "focus";
  source = lib.${namespace}.sources.${pname};
in
buildGoModule rec {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
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
