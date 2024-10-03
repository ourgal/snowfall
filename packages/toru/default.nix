{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "toru";
  version = "0.3.1";

  src = fetchFromGitHub {
    owner = "sweetbbak";
    repo = "toru";
    rev = "v${version}";
    hash = "sha256-SA5DXHKqUslUImoyzGQ9GmoO8RD5UJt6SB03bTTGjaE=";
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
