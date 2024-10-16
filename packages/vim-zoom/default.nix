{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "vim-zoom";
  version = "unstable-2024-07-16";

  src = fetchFromGitHub {
    owner = "ourgal";
    repo = "vim-zoom";
    rev = "65145acd49c62e042502e6f9a5b9b468006c768f";
    hash = "sha256-mTcqxP9mr9P14d7fCUWhIY7Zu4ehjwLJbjMrBsNBUHc=";
  };

  meta = with lib; {
    description = "Toggle zoom in / out individual windows (splits";
    homepage = "https://github.com/ourgal/vim-zoom";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
