{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:

buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {

    vendorHash = null;

    ldflags = [
      "-s"
      "-w"
    ];

    meta = {
      description = "Colored Highlighter - A fast, simple terminal tool to highlight specific words in your command output with colors";
      homepage = "https://github.com/dtonon/ch";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "ch";
    };
  }
)
