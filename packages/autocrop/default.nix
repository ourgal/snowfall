{
  buildGoModule,
  lib,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "autocrop";
  source = lib.${namespace}.sources.${pname};
in
buildGoModule {
  inherit pname;
  version = "unstable-${source.date}";

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  vendorHash = "sha256-qX4sPNq3qjPuwFkGd5Hxb4udLF9GRVfAWTF6M26QRqk=";

  meta = with lib; {
    homepage = "https://github.com/mandykoh/autocrop";
    description = "Automatic energy-based image cropping implementation in Go ";
    platforms = platforms.linux;
  };
}
