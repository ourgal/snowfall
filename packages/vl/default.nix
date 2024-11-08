{
  lib,
  buildGoModule,
  _sources,
}:
buildGoModule {
  inherit (_sources.vl) pname version src;

  vendorHash = "sha256-tikRMS6yx6vs+ai28UEpwLPvL+8w2udh5Wkn4DEIn0A=";

  postInstall = "mv $out/bin/{vl,verify-links}";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "CLI tool that helps verify current status of URIs in text files";
    homepage = "https://github.com/ellisonleao/vl";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "vl";
  };
}
