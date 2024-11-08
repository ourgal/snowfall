{
  lib,
  namespace,
  fetchurl,
  appimageTools,
  _sources,
}:

let
  pname = "akuse";
  pnameCap = lib.${namespace}.capitalize pname;
  source = _sources.${pname};
  inherit (source) version;

  src = fetchurl {
    url = "https://github.com/akuse-app/akuse/releases/download/${version}/linux-akuse-${version}.AppImage";
    hash = "sha256-tBM16s5XTKo06xICf2iKNDcvqLkXYzD+/7qZEIjdiOg=";
  };

  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -Dm444 ${appimageContents}/${pname}-beta.desktop $out/share/applications/${pnameCap}.desktop
    install -Dm444 ${appimageContents}/usr/share/icons/hicolor/0x0/apps/${pname}-beta.png $out/share/pixmaps/${pnameCap}.png
    substituteInPlace $out/share/applications/${pnameCap}.desktop \
      --replace-fail 'Exec=AppRun --no-sandbox %U' 'Exec=${pname}'
  '';
}
