{
  lib,
  buildGoModule,
  _sources',
}:

buildGoModule {
  inherit (_sources' ./.) pname version src;

  vendorHash = "sha256-nMb4moiTMzLSWfe8JJwlH6H//cOHbKWfnM9SM366ey0=";

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
