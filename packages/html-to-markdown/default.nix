{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-ZU2sZZEmnVrrJb4SAAa4A4sYRtRxMgn5FaK9DByGQ2I=";

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
