{
  lib,
  buildGoModule,
  _sources,
}:

buildGoModule {
  inherit (_sources.html-to-markdown) pname version src;

  vendorHash = "sha256-/iIG77PPdkTzWuLMmRPN0Ojxrz4AvEfmaZi+Lo8Ouj0=";

  postInstall = "mv $out/bin/{cli,html2markdown}";

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
