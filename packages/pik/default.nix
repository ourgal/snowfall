{
  lib,
  buildGoModule,
  _sources',
}:
buildGoModule {
  inherit (_sources' ./.) pname version src;

  vendorHash = "sha256-8UprJXRLFO3giWAm8k+vbNz7HPYwKW7cD36qc3hEkzE=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "";
    homepage = "https://github.com/immanelg/pik";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "pik";
  };
}
