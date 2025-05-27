{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-gOUcHp6l1tCr1p8XZaFGXQ3yvtD8QQ4g2BrrxwL0DLM=";

    ldflags = [
      "-s"
      "-w"
    ];

    meta = with lib; {
      description = "Universal data-driven template for generating textual output, as a static binary and a library";
      homepage = "https://github.com/VirtusLab/render";
      license = licenses.asl20;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "render";
    };
  }
)
