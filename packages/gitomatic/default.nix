{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:

buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-Y9XHI5uPzxE6TzNSccpW0Vz+mlV3AvCiHGeHWH3RYjY=";

    ldflags = [
      "-s"
      "-w"
    ];

    meta = {
      description = "A tool to monitor git repositories and automatically pull & push changes";
      homepage = "https://github.com/muesli/gitomatic";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "gitomatic";
    };
  }
)
