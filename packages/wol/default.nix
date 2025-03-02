{
  lib,
  buildGoModule,
  _sources,
}:

buildGoModule rec {
  inherit (_sources.wol) pname version src;

  vendorHash = "sha256-DRA9PPNohzUtrIzucVIke5FhGvvA6zRuJzHt0qfB7PA=";

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/trugamr/wol/cmd.version=${version}"
    "-X=github.com/trugamr/wol/cmd.commit=${src.rev}"
    "-X=github.com/trugamr/wol/cmd.date=1970-01-01T00:00:00Z"
  ];

  meta = {
    description = "Wake up your devices with a single command or click. A Wake-On-LAN tool that works via CLI and web interface";
    homepage = "https://github.com/Trugamr/wol";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "wol";
  };
}
