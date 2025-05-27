{
  buildGoModule,
  lib,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-qX4sPNq3qjPuwFkGd5Hxb4udLF9GRVfAWTF6M26QRqk=";

    meta = with lib; {
      homepage = "https://github.com/mandykoh/autocrop";
      description = "Automatic energy-based image cropping implementation in Go ";
      platforms = platforms.linux;
    };
  }
)
