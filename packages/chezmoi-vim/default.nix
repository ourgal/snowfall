{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "chezmoi-vim";
  version = "unstable-2024-07-26";

  src = fetchFromGitHub {
    owner = "alker0";
    repo = "chezmoi.vim";
    rev = "abf37336437867cbd99ce2f8849b717415391cc3";
    hash = "sha256-S1/myC1dEydi1F9a6XV0lJW3S/wWQe+A2ZXPo8GbtQo=";
  };

  meta = with lib; {
    description = "Highlight dotfiles you manage with chezmoi";
    homepage = "https://github.com/alker0/chezmoi.vim";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "chezmoi-vim";
    platforms = platforms.all;
  };
}
