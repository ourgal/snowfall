{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "vim-toop";
  version = "unstable-2022-11-30";

  src = fetchFromGitHub {
    owner = "ourgal";
    repo = "vim-toop";
    rev = "836c043756b57770068186886b72cbb2fef0d0eb";
    hash = "sha256-+z/4uAIUMqaoXxzqF9qVZsPIWh04zkfybZT+opeJOXg=";
  };

  meta = with lib; {
    description = "Add custom behaviour to your text objects";
    homepage = "https://github.com/jeanCarloMachado/vim-toop";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
