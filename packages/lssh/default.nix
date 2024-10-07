{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "lssh";
  source = lib.${namespace}.sources.${pname};
in
buildGoModule {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
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
