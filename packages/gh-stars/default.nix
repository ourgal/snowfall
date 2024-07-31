{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "gh-stars";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "aymanbagabas";
    repo = "gh-stars";
    rev = "v${version}";
    hash = "sha256-p1GLENa6UIXcasXbJtj5wpS2nMnJzT7V7k3pwfJOano=";
  };

  vendorHash = "sha256-kqo2iGk5omOqGtmKPak70PaMJPxKvOGFnSBZX0++WQk=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "GitHub stargazers in your terminal";
    homepage = "https://github.com/aymanbagabas/gh-stars";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gh-stars";
  };
}
