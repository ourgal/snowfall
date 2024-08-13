{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "lssh";
  version = "0.6.11";

  src = fetchFromGitHub {
    owner = "blacknon";
    repo = "lssh";
    rev = "v${version}";
    hash = "sha256-SzucNPXJHwIZ6cWBLzbMLHJUdnVKdHie7kyoRCF+u4U=";
  };

  vendorHash = null;

  ldflags = [
    "-s"
    "-w"
  ];

  doCheck = false;

  meta = with lib; {
    description = "List selection type ssh/scp/sftp client command. Supports single connection and parallel connection. Local bashrc can also be used without placing it on a remote machine. Written in Golang";
    homepage = "https://github.com/blacknon/lssh";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "lssh";
  };
}
