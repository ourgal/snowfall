{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-FFWptw1kSbl7f8DR3FrM0jAfr06NaJT+i/8ZaQjav/E=";

    ldflags = [
      "-s"
      "-w"
    ];

    meta = {
      description = "CLI that writes git commit messages for you with Google Gemini AI";
      homepage = "https://github.com/tfkhdyt/geminicommit";
      license = lib.licenses.gpl3Only;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "geminicommit";
    };
  }
)
