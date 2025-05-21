{
  lib,
  buildGoModule,
  _sources',
}:

buildGoModule {
  inherit (_sources' ./.) pname version src;

  vendorHash = "sha256-IfqlPg+HPcOfjlwwuLi2/R21UD83xQzWyUmzM7JSDEs=";

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
