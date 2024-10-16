{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "vim-silicon";
  version = "unstable-2020-12-01";

  src = fetchFromGitHub {
    owner = "segeljakt";
    repo = "vim-silicon";
    rev = "4a93122ae2139a12e2a56f064d086c05160b6835";
    hash = "sha256-8pCHtApD/xXav2UBVOVhkaHg3YS4aNCZ73mog04bYuA=";
  };

  meta = with lib; {
    description = "Vim plugin for generating images of source code using https://github.com/Aloxaf/silicon";
    homepage = "https://github.com/segeljakt/vim-silicon";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
