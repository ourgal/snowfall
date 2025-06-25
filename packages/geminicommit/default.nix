{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-AFm+1RQ6sMSe+kY/cw1Ly/8WEj2/yk0nJQiEJzV6jKg=";

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
