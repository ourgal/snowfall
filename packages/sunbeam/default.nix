{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "sunbeam";
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

  vendorHash = "sha256-V3dpE2V08PBp4nJuSuOH8VeTqqnC34kGT/ZdrxtV0W4=";

  ldflags = [
    "s"
    "-w"
    "-X=github.com/pomdtr/sunbeam/internal/cli.Version=${version}"
  ];

  meta = with lib; {
    description = "Command-line launcher";
    homepage = "https://github.com/pomdtr/sunbeam";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "sunbeam";
  };
}
