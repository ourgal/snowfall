{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "vimsuggest";
  version = "unstable-2024-10-15";

  src = fetchFromGitHub {
    owner = "girishji";
    repo = "vimsuggest";
    rev = "5cec83b18ece712e88178dccf77eed68c7d627dc";
    hash = "sha256-iYEKZFKPxhJDooyXXLb/sTRNifFRe3lQqGjAjyqe4sU=";
  };

  meta = with lib; {
    description = "Auto-completion for Vim's command-line";
    homepage = "https://github.com/girishji/vimsuggest";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
