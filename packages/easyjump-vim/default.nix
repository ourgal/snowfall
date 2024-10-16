{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "easyjump-vim";
  version = "unstable-2024-06-06";

  src = fetchFromGitHub {
    owner = "girishji";
    repo = "easyjump.vim";
    rev = "7be7e1b6e8000971d0f6ef9e8480f86094f56635";
    hash = "sha256-SuvbOOp0G+V0X4G++HkiGO0SWaZvCMd7/Y8q9gWvUYE=";
  };

  meta = with lib; {
    description = "The Vim motion you've always wanted";
    homepage = "https://github.com/girishji/easyjump.vim";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
