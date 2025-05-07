{
  lib,
  buildGoModule,
  _sources',
}:

buildGoModule {
  inherit (_sources' ./.) pname version src;

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
