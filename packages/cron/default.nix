{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:

buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = null;

    ldflags = [
      "-s"
      "-w"
    ];

    meta = {
      description = "CLI tool (hcron) and Go library (cron) to convert CRON expression into human readable description";
      homepage = "https://github.com/lnquy/cron";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "hcron";
    };
  }
)
