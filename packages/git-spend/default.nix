{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "git-spend";
  version = "1.2.1";

  src = fetchFromGitHub {
    owner = "Goutte";
    repo = "git-spend";
    rev = version;
    hash = "sha256-4bR5CVM1zTSdLiHyigYgmvpO1VDM6rteeBHuADXq2pk=";
    fetchSubmodules = true;
  };

  vendorHash = "sha256-4ZhAPdENy1fEMKkLLf4RktcKpG8u52G2FG3kpOU3cvY=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Sum the time-tracking \"/spend\" commands of commit messages";
    homepage = "https://github.com/Goutte/git-spend";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-spend";
  };
}
