{
  lib,
  buildGoModule,
  _sources',
}:

buildGoModule {
  inherit (_sources' ./.) pname version src;

  vendorHash = "sha256-lkNvVAtq4CxQQ8Buw+waWbId0XdLRnN/w6pE6C8fEgA=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Uptime monitoring CLI tool with alerting and advanced settings";
    homepage = "https://github.com/Owloops/updo";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "updo";
  };
}
