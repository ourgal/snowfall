{
  lib,
  buildGoModule,
  _sources,
}:
buildGoModule rec {
  inherit (_sources.gitcs) pname src version;

  vendorHash = "sha256-8yzPdVljnODOeI5yWh19BHsF4Pa9BWc49IwenMCVGZo=";

  ldflags = [ "-s" ];

  meta = with lib; {
    description = "Scan local git repositories and generate a visual contributions graph";
    changelog = "https://github.com/knbr13/gitcs/releases/tag/v${version}";
    homepage = "https://github.com/knbr13/gitcs";
    license = licenses.mit;
    maintainers = with maintainers; [ phanirithvij ];
    mainProgram = "gitcs";
  };
}
