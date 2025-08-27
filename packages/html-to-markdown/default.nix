{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-dguaoAf/l3nDZZ5D25uIPsd+/NSCCExfxwd510Pglzs=";

    ldflags = [
      "-s"
      "-w"
    ];

    meta = with lib; {
      description = "Convert HTML to Markdown. Even works with entire websites and can be extended through rules";
      homepage = "https://github.com/JohannesKaufmann/html-to-markdown";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "html-to-markdown";
    };
  }
)
