{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-Ez3nqWJQBgnlgAQs+g3Jn+jE9kkJpSjV8gEpO336tMs=";

    ldflags = [
      "-s"
      "-w"
    ];

    meta = with lib; {
      description = "Command to convert from color text (ANSI or 256) to image";
      homepage = "https://github.com/jiro4989/textimg";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "textimg";
    };
  }
)
