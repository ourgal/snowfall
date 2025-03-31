{
  lib,
  stdenv,
  _sources',
  p7zip,
}:

stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version src;

  unpackCmd = ''
    7z x $src
  '';

  installPhase = "cp -r . $out";

  nativeBuildInputs = [ p7zip ];

  meta = {
    description = "A Dashboard Using Clash API";
    homepage = "https://github.com/Zephyruso/zashboard";
    changelog = "https://github.com/Zephyruso/zashboard/blob/${src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
