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
    vendorHash = "sha256-TEOGMhGY9TdLm1awKM4e/4x2qA5bcdmHJ9mwI1zdsLI=";

    ldflags = [
      "-s"
      "-w"
      "-X=github.com/banh-canh/ytui/cmd.version=${source.version}"
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
)
