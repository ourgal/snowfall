{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
let
  source = _sources' ./.;
in
buildGoModule (
  lib.${namespace}.mkGoSource source
  // {
    vendorHash = null;

    ldflags = [
      "-s"
      "-w"
      "-X=main.version=${source.version}"
      "-X=main.sha=${source.src.rev}"
      "-X=main.buildDate=1970-01-01T00:00:00Z"
      "-X=main.tag=${source.src.rev}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Backup github, gitlab, bitbucket, azure devops, and gitea repositories";
      homepage = "https://github.com/jonhadfield/soba";
      changelog = "https://github.com/jonhadfield/soba/blob/${source.src.rev}/CHANGELOG.md";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "soba";
    };
  }
)
