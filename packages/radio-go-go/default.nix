{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
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
)
