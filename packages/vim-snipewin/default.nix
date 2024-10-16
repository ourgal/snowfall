{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "vim-snipewin";
  version = "unstable-2024-03-28";

  src = fetchFromGitHub {
    owner = "4513ECHO";
    repo = "vim-snipewin";
    rev = "9616fd4564d61c78947e3dda53ef9ac61cce032c";
    hash = "sha256-dUOP8/NBwAhie0DUdkjyCUuoQ9q1UD1PJm02zzz9BNg=";
  };

  meta = with lib; {
    description = "Manipulate windows most quickly like sniper";
    homepage = "https://github.com/4513ECHO/vim-snipewin";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
