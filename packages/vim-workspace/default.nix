{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "vim-workspace";
  version = "unstable-2023-05-29";

  src = fetchFromGitHub {
    owner = "thaerkh";
    repo = "vim-workspace";
    rev = "c0d1e4332a378f58bfdf363b4957168fa78e79b4";
    hash = "sha256-2Brx098dk5THiieBiW71FG9mUUwS1CSY9mpOPWA/Tq4=";
  };

  meta = with lib; {
    description = "Automated Vim session management with file auto-save and persistent undo history";
    homepage = "https://github.com/thaerkh/vim-workspace";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
