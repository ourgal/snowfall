{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "gh-screensaver";
  source = lib.${namespace}.sources.${pname};
in
buildGoModule {
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

  vendorHash = "sha256-o9B6Q07GP/CFekG3av01boZA7FdZg4x8CsLC3lwhn2A=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Full terminal animations";
    homepage = "https://github.com/vilmibm/gh-screensaver";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gh-screensaver";
  };
}
