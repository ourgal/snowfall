{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
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
)
