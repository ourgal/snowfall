{
  lib,
  buildGoModule,
  _sources,
}:

buildGoModule {
  inherit (_sources.v2dat) pname version src;

  vendorHash = "sha256-ndWasQUHt35D528PyGan6JGXh5TthpOhyJI2xBDn0zI=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = {
    description = "A cli tool that can unpack v2ray data packages. (Note: This project is for fun ONLY. You should build your own data dirctly from upstreams instead of unpacking a v2ray data pack";
    homepage = "https://github.com/urlesistiana/v2dat";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "v2dat";
  };
}
