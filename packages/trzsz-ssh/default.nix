{
  lib,
  buildGoModule,
  _sources',
}:
buildGoModule {
  inherit (_sources' ./.) pname src version;

  vendorHash = "sha256-EllXxDyWI4Dy5E6KnzYFxuYDQcdk9+01v5svpARZU44=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Trzsz-ssh ( tssh ) is an ssh client designed as a drop-in replacement for the openssh client. It aims to provide complete compatibility with openssh, mirroring all its features, while also offering additional useful features. Such as login prompt, batch login, remember password, automated interaction, trzsz, zmodem(rz/sz), udp mode like mosh, etc";
    homepage = "https://github.com/trzsz/trzsz-ssh";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "trzsz-ssh";
  };
}
