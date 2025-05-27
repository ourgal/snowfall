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

    meta = with lib; {
      description = "ASCII Tree to Directory and File Structure Generator";
      homepage = "https://github.com/bilbilak/treegen";
      license = licenses.gpl3Only;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "treegen";
    };
  }
)
