{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "pangu-vim";
  version = "unstable-2023-02-19";

  src = fetchFromGitHub {
    owner = "hotoo";
    repo = "pangu.vim";
    rev = "b7210117695dca05d94de1ac2108401f8eff0a2d";
    hash = "sha256-MvT/3keKv05ZetWnKRA9nD2AyJKoyeLV7rtPlCCl98Q=";
  };

  meta = with lib; {
    description = "盘古之白』中文排版自动规范化的 Vim 插件";
    homepage = "https://github.com/hotoo/pangu.vim";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
