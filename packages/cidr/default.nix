{
  lib,
  buildGoModule,
  _sources,
}:

buildGoModule rec {
  inherit (_sources.cidr) pname version src;

  vendorHash = "sha256-gM3qgRK+L4qg9dnbQWQc/AoWyrcFsNc1r1KpdUug3nU=";

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/bschaatsbergen/cidr/cmd.version=${version}"
  ];

  meta = with lib; {
    description = "Simplifies IPv4/IPv6 CIDR network prefix management with counting, overlap checking, explanation, and subdivision";
    homepage = "https://github.com/bschaatsbergen/cidr";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "cidr";
  };
}
