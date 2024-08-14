{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "radio-go-go";
  version = "0.3.2";

  src = fetchFromGitHub {
    owner = "matteo-pacini";
    repo = "RadioGoGo";
    rev = "v${version}";
    hash = "sha256-vEZUBA+KeDHgqZvzrAN6ramZ5D4iqQdVU+qFOK/39co=";
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
