{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
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
)
