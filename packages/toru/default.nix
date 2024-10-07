{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "toru";
  source = lib.${namespace}.sources.${pname};
in
buildGoModule rec {
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

  vendorHash = "sha256-04fHwblTspzecnTizUlFqLwtcnBsHrFRvLX1eSXztRI=";

  ldflags = [
    "-s"
    "-w"
    "-X=main.version=${version}"
  ];

  meta = with lib; {
    description = "Bittorrent streaming CLI tool. Stream anime torrents, real-time with no waiting for downloads";
    homepage = "https://github.com/sweetbbak/toru";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "toru";
  };
}
