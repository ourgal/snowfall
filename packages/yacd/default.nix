{
  lib,
  stdenv,
  _sources',
}:

stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version src;

  installPhase = "cp -r . $out";

  meta = {
    description = "Yet Another Clash Dashboard";
    homepage = "https://github.com/haishanh/yacd";
    changelog = "https://github.com/haishanh/yacd/blob/${src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
