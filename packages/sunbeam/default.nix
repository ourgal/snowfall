{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
let
  source = _sources' ./.;
in
buildGoModule (
  lib.${namespace}.mkGoSource source
  // {
    vendorHash = "sha256-+RMmbKCY9Q8w58ksK7PgtM2mo5bOc6HJFJsfdWIYDnE=";

    ldflags = [
      "s"
      "-w"
      "-X=github.com/pomdtr/sunbeam/internal/cli.Version=${source.version}"
    ];

    meta = with lib; {
      description = "Command-line launcher";
      homepage = "https://github.com/pomdtr/sunbeam";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "sunbeam";
    };
  }
)
