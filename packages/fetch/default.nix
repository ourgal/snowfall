{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "fetch";
  version = "0.4.6";

  src = fetchFromGitHub {
    owner = "gruntwork-io";
    repo = "fetch";
    rev = "v${version}";
    hash = "sha256-otHsP3Y8FZqB9omNYuM7gZfolqFiDwlXLEXeJB3pefI=";
  };

  vendorHash = "sha256-WS1DZqExyXYRs+4PsXzgMa+wUx1L+Y8KEaK7P5JVMOk=";

  ldflags = [
    "-s"
    "-w"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Download files, folders, and release assets from a specific git commit, branch, or tag of public and private GitHub repos";
    homepage = "https://github.com/gruntwork-io/fetch";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "fetch";
  };
}
