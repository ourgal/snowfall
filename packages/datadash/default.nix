{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-naG4vVuuUqXFOpAJbzeIQ09ZjETUENE4elERldNkCO8=";

    ldflags = [
      "-s"
      "-w"
    ];

    postFixup = "mv $out/bin/{cmd,datadash}";

    meta = with lib; {
      description = "Visualize and graph data in the terminal";
      homepage = "https://github.com/keithknott26/datadash";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "datadash";
    };
  }
)
