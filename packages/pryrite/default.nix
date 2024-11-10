{
  lib,
  buildGoModule,
  _sources,
}:

buildGoModule {
  inherit (_sources.pryrite) pname version src;

  vendorHash = "sha256-L6bjPZ2d7aXzPw+p3X4s0h6YV1Wf4IRbj9ADV6GCOOY=";

  ldflags = [
    "-s"
    "-w"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Pryrite, interactively execute shell code blocks in a markdown file";
    homepage = "https://github.com/1xyz/pryrite";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "pryrite";
  };
}
