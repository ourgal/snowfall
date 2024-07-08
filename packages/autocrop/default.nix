{
  buildGoModule,
  lib,
  fetchFromGitHub,
  ...
}:

buildGoModule {
  pname = "autocrop";
  version = "2021-06-03";

  src = fetchFromGitHub {
    owner = "mandykoh";
    repo = "autocrop";
    rev = "2afe00ed87fb10a6d368d0d4140307dc99b1a545";
    hash = "sha256-oxvu0P0LmusFQ5qX557pgyiq+eslWwfCaoEAkxJnqOA=";
  };

  vendorHash = "sha256-qX4sPNq3qjPuwFkGd5Hxb4udLF9GRVfAWTF6M26QRqk=";

  meta = with lib; {
    homepage = "https://github.com/mandykoh/autocrop";
    description = "Automatic energy-based image cropping implementation in Go ";
    platforms = platforms.linux;
  };
}
