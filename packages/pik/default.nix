{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "pik";
  source = lib.${namespace}.sources.${pname};
in
buildGoModule {
  pname = "pik";
  version = "unstable-${source.date}";

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

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
