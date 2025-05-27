{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-YfaMSqwdD1t47MwJkuA91scu1QREb6srX5IcBdDSK1o=";

    ldflags = [
      "-s"
      "-w"
    ];

    doCheck = false;

    meta = with lib; {
      description = "A powerful cross-platform project templating tool";
      homepage = "https://github.com/proji-rocks/proji";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "proji";
    };
  }
)
