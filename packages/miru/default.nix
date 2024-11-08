{
  lib,
  namespace,
  fetchurl,
  appimageTools,
  _sources,
}:

let
  pname = "miru";
  pnameCap = lib.${namespace}.capitalize pname;
  source = _sources.${pname};
  inherit (source) version;

  src = fetchurl {
    url = "https://github.com/ThaUnknown/miru/releases/download/v${version}/linux-Miru-${version}.AppImage";
    hash = "sha256-yfavGhH/QROChWB0MxYt8+dssYo0+/1bV+h2Ce951RE=";
  };

  appimageContents = appimageTools.extract { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraPkgs = pkgs: with pkgs; [ mpv ];

  extraInstallCommands = ''
    install -Dm444 ${appimageContents}/${pname}.desktop $out/share/applications/${pnameCap}.desktop
    install -Dm444 ${appimageContents}/usr/share/icons/hicolor/256x256/apps/${pname}.png $out/share/pixmaps/${pnameCap}.png
    substituteInPlace $out/share/applications/${pnameCap}.desktop \
      --replace-fail 'Exec=AppRun --no-sandbox %U' 'Exec=${pname}'
  '';
}
