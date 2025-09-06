{
  lib,
  mpvScripts,
  _sources',
}:

mpvScripts.buildLua {
  inherit (_sources' ./.) pname version src;

  postPatch = ''
    substituteInPlace blur.lua \
      --replace-fail 'video-aspect' 'video-params/aspect'
  '';

  scriptPath = "blur.lua";

  meta = {
    description = "A standalone script to produce blur effect in mpv";
    homepage = "https://github.com/Ajatt-Tools/blur-mpv";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
