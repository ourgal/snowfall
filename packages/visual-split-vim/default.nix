{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "visual-split-vim";
  version = "unstable-2017-01-29";

  src = fetchFromGitHub {
    owner = "wellle";
    repo = "visual-split.vim";
    rev = "423a25911b3e8da04a28d29f205e1059a06e6afa";
    hash = "sha256-v0j6AExrOJIgde/Aphr7lvonZptMwYQLCB6E+2YsiVg=";
  };

  meta = with lib; {
    description = "Vim plugin to control splits with visual selections or text objects";
    homepage = "https://github.com/wellle/visual-split.vim";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
