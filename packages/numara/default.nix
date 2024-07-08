{
  lib,
  namespace,
  fetchurl,
  appimageTools,
}:

let
  pname = "numara";
  pnameCap = lib.${namespace}.capitalize pname;
  version = "5.1.3";

  src = fetchurl {
    url = "https://github.com/bornova/numara-calculator/releases/download/v${version}/Numara-${version}-x86_64.AppImage";
    hash = "sha256-ejGTYWhBmUAo2KiChvx0hClTXt5sqV7LMACKOS05kTI=";
  };

  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;
  #    mv $out/bin/{${pname}-${version},${pname}}

  extraInstallCommands = ''
    install -Dm444 ${appimageContents}/${pname}.desktop $out/share/applications/${pnameCap}.desktop
    install -Dm444 ${appimageContents}/usr/share/icons/hicolor/256x256/apps/${pname}.png $out/share/pixmaps/${pnameCap}.png
    substituteInPlace $out/share/applications/${pnameCap}.desktop \
      --replace 'Exec=AppRun --no-sandbox %U' 'Exec=${pname}'
  '';
}
