{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-ZPyep0kLfzT7H4fiOv7rq3pKXCFYS9P76celBRiFLcE=";

    ldflags = [
      "-s"
      "-w"
    ];

    meta = with lib; {
      description = "This is a CLI tool to download shared files and folders from Google Drive";
      homepage = "https://github.com/tanaikech/goodls";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "goodls";
    };
  }
)
