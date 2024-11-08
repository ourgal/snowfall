{
  lib,
  namespace,
  fetchurl,
  appimageTools,
  _sources,
}:

let
  pname = "numara";
  pnameCap = lib.${namespace}.capitalize pname;
  source = _sources.${pname};
  inherit (source) version;

  src = fetchurl {
    url = "https://github.com/bornova/numara-calculator/releases/download/v${version}/Numara-${version}-x86_64.AppImage";
    hash = "sha256-MBu8wo04R0zpc2eSuHFJtWVtRleCRQiM1bxsLUXrQYo=";
  };

  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;
  #    mv $out/bin/{${pname}-${version},${pname}}

  extraInstallCommands = ''
    install -Dm444 ${appimageContents}/${pname}.desktop $out/share/applications/${pnameCap}.desktop
    install -Dm444 ${appimageContents}/usr/share/icons/hicolor/512x512/apps/${pname}.png $out/share/pixmaps/${pnameCap}.png
    substituteInPlace $out/share/applications/${pnameCap}.desktop \
      --replace-fail 'Exec=AppRun --no-sandbox %U' 'Exec=${pname}'
  '';
}
