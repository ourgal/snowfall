{
  lib,
  buildGoModule,
  namespace,
  pkgs,
}:
let
  pname = "flatpak-compose";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname version src;

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
