{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "compose2nix";
  version = "0.2.2";

  src = fetchFromGitHub {
    owner = "aksiksi";
    repo = "compose2nix";
    rev = "v${version}";
    hash = "sha256-2t4pXTzd5TDpAOzNS8MfnE9p8Rm55OPLaEpSPF4/UbE=";
  };

  vendorHash = "sha256-SwJzyOXE23BLoJ+efFuSIhDTMjirEUmBhGGmgrnKhXw=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Generate a NixOS config from a Docker Compose project";
    homepage = "https://github.com/aksiksi/compose2nix";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "compose2nix";
  };
}
