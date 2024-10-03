{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "goodls";
  version = "2.0.5";

  src = fetchFromGitHub {
    owner = "tanaikech";
    repo = "goodls";
    rev = "v${version}";
    hash = "sha256-SrDDRQvogsYtdp8El/NOeeTOg0RKqaR3m7dq4Lhqrps=";
  };

  vendorHash = "sha256-ZPyep0kLfzT7H4fiOv7rq3pKXCFYS9P76celBRiFLcE=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "This is a CLI tool to download shared files and folders from Google Drive";
    homepage = "https://github.com/tanaikech/goodls";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "goodls";
  };
}
