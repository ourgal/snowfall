{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "vim-floaterm";
  version = "unstable-2024-04-08";

  src = fetchFromGitHub {
    owner = "voldikss";
    repo = "vim-floaterm";
    rev = "4e28c8dd0271e10a5f55142fb6fe9b1599ee6160";
    hash = "sha256-wIgcBcdxJsT+qrsC5Boj6hp0xpp5gFeQFhK7yyC5a1o=";
  };

  patches = [ ./broot.patch ];

  meta = with lib; {
    description = "Computer: Terminal manager for (neo)vim";
    homepage = "https://github.com/voldikss/vim-floaterm";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "vim-floaterm";
    platforms = platforms.all;
  };
}
