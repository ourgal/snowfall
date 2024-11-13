{
  lib,
  mpvScripts,
  nodePackages,
  xidel,
  jq,
  makeWrapper,
  _sources,
}:

mpvScripts.buildLua {
  inherit (_sources.mpv-webtorrent-hook) pname version src;

  scriptPath = "main.lua";

  extraScripts = [
    "webtorrent-wrap.sh"
    "webtorrent-speed-printer.sh"
  ];

  nativeBuildInputs = [ makeWrapper ];

  preInstall = ''
    patchShebangs .
    substituteInPlace main.lua \
      --replace-fail 'mp.get_script_directory()' "\"$out/share/mpv/scripts\""
  '';

  postInstall = ''
    wrapProgram $out/share/mpv/scripts/webtorrent-wrap.sh --prefix PATH:${
      lib.makeBinPath [
        nodePackages.webtorrent-cli
        xidel
        jq
      ]
    }
  '';

  meta = with lib; {
    description = "Stream torrents in mpv using webtorrent-cli";
    homepage = "https://github.com/noctuid/mpv-webtorrent-hook";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "mpv-webtorrent-hook";
    platforms = platforms.all;
  };
}
