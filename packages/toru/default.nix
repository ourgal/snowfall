{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
let
  source = _sources' ./.;
in
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-04fHwblTspzecnTizUlFqLwtcnBsHrFRvLX1eSXztRI=";

    ldflags = [
      "-s"
      "-w"
      "-X=main.version=${source.version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Bittorrent streaming CLI tool. Stream anime torrents, real-time with no waiting for downloads";
      homepage = "https://github.com/sweetbbak/toru";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "toru";
    };
  }
)
