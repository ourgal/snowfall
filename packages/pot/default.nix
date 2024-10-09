{
  lib,
  namespace,
  fetchurl,
  appimageTools,
  pkgs,
}:

let
  pname = "pot";
  pnameCap = lib.${namespace}.capitalize pname;
  source = pkgs.${namespace}.sources.${pname};
  inherit (source) version;

  src = fetchurl {
    url = "https://github.com/pot-app/pot-desktop/releases/download/${version}/pot_${version}_amd64.AppImage";
    hash = "sha256-anBEMfVyiiLtXd24/sNUV7luoPPXb5gFJctDx95PFRA=";
  };

  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -Dm444 ${appimageContents}/${pname}.desktop $out/share/applications/${pnameCap}.desktop
    install -Dm444 ${appimageContents}/usr/share/icons/hicolor/256x256@2/apps/${pname}.png $out/share/pixmaps/${pnameCap}.png
  '';
}
