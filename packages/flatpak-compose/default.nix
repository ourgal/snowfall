{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "flatpak-compose";
  source = lib.${namespace}.sources.${pname};
in
buildGoModule {
  inherit pname;
  inherit (source) version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

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
