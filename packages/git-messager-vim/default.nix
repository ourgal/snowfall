{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "git-messenger-vim";
  version = "unstable-2024-09-05";

  src = fetchFromGitHub {
    owner = "rhysd";
    repo = "git-messenger.vim";
    rev = "edc603d4cda7894a743e383e16c638e206d03148";
    hash = "sha256-SgivafrSdql6yG0Nj2+zo0dWE7x3YigzD6kJRrucPC0=";
  };

  meta = with lib; {
    description = "Vim and Neovim plugin to reveal the commit messages under the cursor";
    homepage = "https://github.com/rhysd/git-messenger.vim";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
