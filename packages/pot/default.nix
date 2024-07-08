{
  lib,
  namespace,
  fetchurl,
  appimageTools,
}:

let
  pname = "pot";
  pnameCap = lib.${namespace}.capitalize pname;
  version = "2.7.10";

  src = fetchurl {
    url = "https://github.com/pot-app/pot-desktop/releases/download/${version}/pot_${version}_amd64.AppImage";
    hash = "sha256-QrIVOWx3iefpmnzbcy+WMnruWT9t/s/eFw9NjDzm6eo=";
  };

  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;
  #    mv $out/bin/{${pname}-${version},${pname}}

  extraInstallCommands = ''
    install -Dm444 ${appimageContents}/${pname}.desktop $out/share/applications/${pnameCap}.desktop
    install -Dm444 ${appimageContents}/usr/share/icons/hicolor/256x256@2/apps/${pname}.png $out/share/pixmaps/${pnameCap}.png
    substituteInPlace $out/share/applications/${pnameCap}.desktop \
      --replace 'Exec=AppRun --no-sandbox %U' 'Exec=${pname}'
  '';
}
