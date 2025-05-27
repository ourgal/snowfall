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
      description = "A lightweight monitoring service that efficiently checks socket connections and can be configured remotely";
      homepage = "https://github.com/thevxn/dish";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "dish";
    };
  }
)
