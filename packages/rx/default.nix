{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-/eRPYewaNmLzw/NnCP3A2vwzBSO5SjoAKZZbxWsjY5o=";

    ldflags = [
      "-s"
      "-w"
    ];

    meta = {
      description = "Regex eXplorer, allows you to test your regexes with live-reload";
      homepage = "https://github.com/f01c33/rx";
      license = lib.licenses.unfree; # FIXME: nix-init did not find a license
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "rx";
    };
  }
)
