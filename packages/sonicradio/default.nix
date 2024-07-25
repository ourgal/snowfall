{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "sonicradio";
  version = "0.3.2";

  src = fetchFromGitHub {
    owner = "dancnb";
    repo = "sonicradio";
    rev = "v${version}";
    hash = "sha256-i9IBe5jcCCzWRxu+dbx3neu5jakZe/Zzi3+FgtYNynk=";
  };

  vendorHash = "sha256-m4QIGiuk8SbuwLI+Lp+NHgEZOvtwo7rbUiVmm7jwJ24=";

  ldflags = [
    "-s"
    "-w"
  ];

  doCheck = false;

  meta = with lib; {
    description = "A TUI radio player making use of Radio Browser API and Bubbletea";
    homepage = "https://github.com/dancnb/sonicradio";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "sonicradio";
  };
}
