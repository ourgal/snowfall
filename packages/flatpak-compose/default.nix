{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-1TyFfRL6HTOa+M4CEcHeiReRcPlPNKMneq2AVXS0kX0=";

    ldflags = [
      "-s"
      "-w"
    ];

    postInstall = ''
      mv $out/bin/cmd $out/bin/flatpak-compose
    '';

    subPackages = [ "./cmd" ];

    meta = with lib; {
      description = "Define your flatpak applications and permissions";
      homepage = "https://github.com/faan11/flatpak-compose";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "flatpak-compose";
    };
  }
)
