{
  lib,
  vimUtils,
  fetchFromGitHub,
}:

vimUtils.buildVimPlugin {
  pname = "vim-dirvish-dovish";
  version = "unstable-2022-06-10";

  src = fetchFromGitHub {
    owner = "roginfarrer";
    repo = "vim-dirvish-dovish";
    rev = "04c77b6010f7e45e72b4d3c399c120d42f7c5d47";
    hash = "sha256-8uw1Ft48JVphhdhd9TBcB3b9NFBRkwdEQH2LZblE1dk=";
  };

  meta = {
    description = "File manipulation commands for vim-dirvish";
    homepage = "https://github.com/roginfarrer/vim-dirvish-dovish";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
