{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "flatpak-compose";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "faan11";
    repo = "flatpak-compose";
    rev = version;
    hash = "sha256-BpsEelrtb5yWRiP70/wIsrYWS2aFl6tUFbQ8ChTrj+s=";
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
