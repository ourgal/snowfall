{
  lib,
  python3,
  _sources',
}:

python3.pkgs.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  postPatch = "cp ${./pyproject.toml} pyproject.toml";

  build-system = [ python3.pkgs.hatchling ];

  dependencies = with python3.pkgs; [
    requests
    pyyaml
    rich
    aiohttp
    python-json-logger
    python-dateutil
    requests-toolbelt
    tqdm
  ];

  meta = {
    description = "抖音批量下载工具，去水印，支持视频、图集、合集、音乐(原声)。免费！免费！免费";
    homepage = "https://github.com/jiji262/douyin-downloader";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "douyin-downloader";
    platforms = lib.platforms.all;
  };
}
