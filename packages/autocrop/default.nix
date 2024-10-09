{
  buildGoModule,
  lib,
  namespace,
  pkgs,
}:
let
  pname = "autocrop";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname src version;

  vendorHash = "sha256-qX4sPNq3qjPuwFkGd5Hxb4udLF9GRVfAWTF6M26QRqk=";

  meta = with lib; {
    homepage = "https://github.com/mandykoh/autocrop";
    description = "Automatic energy-based image cropping implementation in Go ";
    platforms = platforms.linux;
  };
}
