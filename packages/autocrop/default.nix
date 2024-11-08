{
  buildGoModule,
  lib,
  _sources,
}:
buildGoModule {
  inherit (_sources.autocrop) pname src version;

  vendorHash = "sha256-qX4sPNq3qjPuwFkGd5Hxb4udLF9GRVfAWTF6M26QRqk=";

  meta = with lib; {
    homepage = "https://github.com/mandykoh/autocrop";
    description = "Automatic energy-based image cropping implementation in Go ";
    platforms = platforms.linux;
  };
}
