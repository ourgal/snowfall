{
  lib,
  namespace,
  appimageTools,
  _sources',
}:

let
  inherit (_sources' ./.) pname version src;
  pnameCap = lib.${namespace}.capitalize pname;
  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -Dm444 ${appimageContents}/${pname}.desktop $out/share/applications/${pnameCap}.desktop
    install -Dm444 ${appimageContents}/usr/share/icons/hicolor/512x512/apps/${pname}.png $out/share/pixmaps/${pnameCap}.png
    substituteInPlace $out/share/applications/${pnameCap}.desktop \
      --replace-fail 'Exec=AppRun --no-sandbox %U' 'Exec=${pname}'
  '';
}
