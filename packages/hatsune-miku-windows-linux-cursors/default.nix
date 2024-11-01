{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "hatsune-miku-windows-linux-cursors";
  version = "1.2.4";

  src = fetchFromGitHub {
    owner = "supermariofps";
    repo = "hatsune-miku-windows-linux-cursors";
    rev = version;
    hash = "sha256-PB8b/hGH5HtCEPOVPTtObWYOj520TqBpoxavA8Tfx2s=";
  };

  dontBuild = true;

  installPhase = ''
    install -dm 0755 $out/share/icons
    cp -pr miku-cursor-linux $out/share/icons
  '';

  meta = with lib; {
    description = "Hatsune Miku Cursors for Windows/Linux";
    homepage = "https://github.com/supermariofps/hatsune-miku-windows-linux-cursors";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
