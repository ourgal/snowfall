{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "git-lens-vim";
  version = "unstable-2024-04-14";

  src = fetchFromGitHub {
    owner = "Eliot00";
    repo = "git-lens.vim";
    rev = "6c22e05c3e43bbe6e2cdc02bbc2978886e50e27c";
    hash = "sha256-YZdiYB1YJFv/oCJSC/Ld0QBDTp+mqItwIWURbbN9yCw=";
  };

  meta = with lib; {
    description = "A vim9 plugin inspired by VSCode's GitLens";
    homepage = "https://github.com/Eliot00/git-lens.vim";
    license = licenses.agpl3Only;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
