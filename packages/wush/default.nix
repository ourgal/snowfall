{
  lib,
  buildGoModule,
  _sources,
}:
buildGoModule rec {
  inherit (_sources.wush) pname version src;

  vendorHash = "sha256-Po1DDKP9ekScRDGMjCXZr9HUUwFenQx3bzIZrNI+ctY=";

  ldflags = [
    "-s"
    "-w"
    "-X=main.version=${version}"
    "-X=main.commit=${src.rev}"
    "-X=main.commitDate=0"
  ];

  meta = with lib; {
    description = "Simplest & fastest way to transfer files between computers via WireGuard";
    homepage = "https://github.com/coder/wush";
    license = licenses.cc0;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "wush";
  };
}
