{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule {
  pname = "pik";
  version = "unstable-2024-07-03";

  src = fetchFromGitHub {
    owner = "immanelg";
    repo = "pik";
    rev = "c01a25e48a6896cd45861dd2e2c0c713d21c1c2e";
    hash = "sha256-uyevpohiDqlKU+ZCjs6hwviLxnUQMPk/ZxclMFkBSCo=";
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
