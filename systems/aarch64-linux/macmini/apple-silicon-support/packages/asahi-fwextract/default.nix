{
  python3Packages,
  fetchFromGitHub,
  gzip,
  gnutar,
  lzfse,
  lib,
}:

python3Packages.buildPythonApplication rec {
  pname = "asahi-fwextract";
  version = "0.7.8";
  pyproject = true;

  build-system = [ python3Packages.setuptools ];

  # tracking version: https://packages.fedoraproject.org/pkgs/asahi-installer/python3-asahi_firmware/
  src = fetchFromGitHub {
    owner = "AsahiLinux";
    repo = "asahi-installer";
    rev = "v${version}";
    hash = "sha256-UmgHWKIRbcg9PK44YPPM4tyuEDC0+ANKO3Mzc4N9RHo=";
  };

  postPatch = ''
    substituteInPlace asahi_firmware/img4.py \
      --replace 'liblzfse.so' '${lzfse}/lib/liblzfse.so'
    substituteInPlace asahi_firmware/update.py \
      --replace '"tar"' '"${lib.getExe gnutar}"' \
      --replace '"xf"' '"-x", "-I", "${lib.getExe gzip}", "-f"'
  '';

  doCheck = false;
}
