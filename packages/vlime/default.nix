{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "vlime";
  version = "unstable-2023-10-08";

  src = fetchFromGitHub {
    owner = "vlime";
    repo = "vlime";
    rev = "f57518bf6ac1b6c5e10db6a9259016b84ff81d8b";
    hash = "sha256-034h9L9k+X3b+Z1Kt6HGiteYbHajoo8wu5zgh7RIjv8=";
  };

  meta = with lib; {
    description = "A Common Lisp dev environment for Vim (and Neovim";
    homepage = "https://github.com/vlime/vlime";
    changelog = "https://github.com/vlime/vlime/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
