{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "wush";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "coder";
    repo = "wush";
    rev = "v${version}";
    hash = "sha256-r6LKEL9GxyiyQgM4AuLU/FcmYKOCg7EZDmAZQznCx8E=";
  };

  vendorHash = "sha256-e1XcoiJ55UoSNFUto6QM8HrQkkrBf8sv4L9J+7Lnu2I=";

  ldflags = [
    "-s"
    "-w"
    "-X=main.version=${version}"
    "-X=main.commit=${src.rev}"
    "-X=main.commitDate=0"
  ];

  meta = with lib; {
    description = "Simplest & fastest way to transfer files between computers via WireGuard";
    homepage = "https://github.com/coder/wush";
    license = licenses.cc0;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "wush";
  };
}
