{
  lib,
  buildGoModule,
  _sources',
}:

buildGoModule {
  inherit (_sources' ./.) pname version src;

  vendorHash = "sha256-+Y4MD9HBjKn09+1KhgU9u7xaj/MhG9k7S48g/sprB1o=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Manage and sync your Miniflux feeds with YAML";
    homepage = "https://github.com/revett/miniflux-sync";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "miniflux-sync";
  };
}
