{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "radio-go-go";
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

  vendorHash = "sha256-hYEXzKrACpSyvrAYbV0jkX504Ix/ch2PVrhksYKFhwE=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Go-powered CLI to surf global radio waves via a sleek TUI. Tune in & let's Go";
    homepage = "https://github.com/matteo-pacini/RadioGoGo";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "radio-go-go";
  };
}
