{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "vim-visual-star-search";
  version = "unstable-2024-07-16";

  src = fetchFromGitHub {
    owner = "ourgal";
    repo = "vim-visual-star-search";
    rev = "3ea07a973a8f3cb2b714c50ac0adca35da157631";
    hash = "sha256-hiL9DuvQl4wUSZWCLJjGZYWLzIRXqbVCtZ1GLJTKFp4=";
  };

  meta = with lib; {
    description = "Start a * or # search from a visual block";
    homepage = "https://github.com/ourgal/vim-visual-star-search";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
