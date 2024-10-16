{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "tokyonight-vim";
  version = "unstable-2021-04-23";

  src = fetchFromGitHub {
    owner = "ghifarit53";
    repo = "tokyonight-vim";
    rev = "4e82e0f0452a6ce8f387828ec71013015515035a";
    hash = "sha256-ui/6xv8PH6KuQ4hG1FNMf6EUdF2wfWPNgG/GMXYvn/8=";
  };

  meta = with lib; {
    description = "A clean, dark vim colorscheme that celebrates the lights of downtown Tokyo at night, based on a VSCode theme by @enkia with the same name [Archived because I'm no longer using this";
    homepage = "https://github.com/ghifarit53/tokyonight-vim";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
