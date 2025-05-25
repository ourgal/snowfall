{
  lib,
  mpvScripts,
  btfs,
  makeWrapper,
  fuse,
  _sources',
}:

mpvScripts.buildLua {
  inherit (_sources' ./.) pname version src;

  scriptPath = "main.lua";

  extraScripts = [
    "btfs-cleanup.sh"
    "background-btfs-cleanup.sh"
  ];

  nativeBuildInputs = [ makeWrapper ];

  preInstall = ''
    patchShebangs .
    substituteInPlace main.lua \
      --replace-fail 'mp.get_script_directory()' "\"$out/share/mpv/scripts\"" \
      --replace-fail '"btfs"' "\"${btfs}/bin/btfs\""
  '';

  postInstall = ''
    wrapProgram $out/share/mpv/scripts/btfs-cleanup.sh --prefix PATH:${lib.makeBinPath [ fuse ]}
  '';

  meta = with lib; {
    description = "Stream torrents in mpv using btfs";
    homepage = "https://github.com/noctuid/mpv-btfs-stream";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
