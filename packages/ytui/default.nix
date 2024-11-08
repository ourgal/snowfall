{
  lib,
  buildGoModule,
  _sources,
}:
buildGoModule rec {
  inherit (_sources.ytui) pname version src;

  vendorHash = "sha256-qDzvLKsf3/5xgVtjE/ogrq8xTZDtjpVol+rqL0P60GM=";

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/banh-canh/ytui/cmd.version=${version}"
  ];

  doCheck = false;

  postInstall = "rm $out/bin/scripts";

  meta = with lib; {
    description = "Ytui is a TUI tool that allows users to query videos on youtube and play them in their local player";
    homepage = "https://github.com/Banh-Canh/ytui";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "ytui";
  };
}
