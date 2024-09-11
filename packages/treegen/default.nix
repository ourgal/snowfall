{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "treegen";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "bilbilak";
    repo = "treegen";
    rev = "v${version}";
    hash = "sha256-z6CHr89fC9UVQgPmugOctB82XQ8yP6K5Ap2qsMLSnyk=";
  };

  vendorHash = null;

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "ASCII Tree to Directory and File Structure Generator";
    homepage = "https://github.com/bilbilak/treegen";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "treegen";
  };
}
