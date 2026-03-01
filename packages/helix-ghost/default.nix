{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:

buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {

    vendorHash = "sha256-TgcH7PAH8VZyPJJPmwxkDhfTcJ/10LWl6kKWGHV7e+c=";

    ldflags = [
      "-s"
      "-w"
    ];

    meta = {
      description = "Helix client for GhostText - Edit browser text areas in Helix (or another editor";
      homepage = "https://github.com/rahji/helix-ghost";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "helix-ghost";
    };
  }
)
