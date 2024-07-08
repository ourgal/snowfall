{
  lib,
  namespace,
  fetchurl,
  appimageTools,
}:

let
  pname = "miru";
  pnameCap = lib.${namespace}.capitalize pname;
  version = "5.1.10";

  src = fetchurl {
    url = "https://github.com/ThaUnknown/miru/releases/download/v${version}/linux-Miru-${version}.AppImage";
    hash = "sha256-j7a//1lhVRym9qVZLeYWligh1B8tsJUfXNSWEgDJmh4=";
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
      --replace 'Exec=AppRun --no-sandbox %U' 'Exec=${pname}'
  '';
}
