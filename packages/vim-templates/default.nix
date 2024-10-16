{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "vim-templates";
  version = "unstable-2024-04-25";

  src = fetchFromGitHub {
    owner = "tibabit";
    repo = "vim-templates";
    rev = "c4ce1903fc458688bc421f0cb4572af8a8977cdb";
    hash = "sha256-p0TEJr/2TBoOk48xgtrqwnAtQlYRkz/NEKcadLAJoCA=";
  };

  meta = with lib; {
    description = "Create files from templates";
    homepage = "https://github.com/tibabit/vim-templates";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
