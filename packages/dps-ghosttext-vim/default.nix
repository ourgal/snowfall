{
  lib,
  vimUtils,
  fetchFromGitHub,
}:

vimUtils.buildVimPlugin {
  pname = "dps-ghosttext-vim";
  version = "unstable-2024-10-18";

  src = fetchFromGitHub {
    owner = "gamoutatsumi";
    repo = "dps-ghosttext.vim";
    rev = "70eb098546c498342bba6d6568b60558d33d613c";
    hash = "sha256-w34dragcm/7E7jz6ZQsPKSNCBNwgk3kbSzEM1IPzuc8=";
  };

  meta = {
    description = "GhostText plugin powered by denops.vim";
    homepage = "https://github.com/gamoutatsumi/dps-ghosttext.vim";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
