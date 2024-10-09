{
  lib,
  buildGoModule,
  namespace,
  pkgs,
}:
let
  pname = "toru";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule rec {
  inherit (source) pname version src;

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
