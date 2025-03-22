{
  lib,
  buildGoModule,
  _sources,
}:

buildGoModule {
  inherit (_sources.html-to-markdown) pname version src;

  vendorHash = "sha256-1Rdjv/ayhcWi6FOd/QKgB7TlU9CbF/x8vUdksYRKL1k=";

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
