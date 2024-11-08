{
  lib,
  namespace,
  fetchurl,
  appimageTools,
  _sources,
}:

let
  pname = "pot";
  pnameCap = lib.${namespace}.capitalize pname;
  source = _sources.${pname};
  inherit (source) version;

  src = fetchurl {
    url = "https://github.com/pot-app/pot-desktop/releases/download/${version}/pot_${version}_amd64.AppImage";
    hash = "sha256-KZU6kVD7m3unfSscm4uHWG3JLWnd0pGzl0PHtNKaRu0=";
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
