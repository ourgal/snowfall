{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "vim-hug-neovim-rpc";
  version = "unstable-2021-05-15";

  src = fetchFromGitHub {
    owner = "roxma";
    repo = "vim-hug-neovim-rpc";
    rev = "93ae38792bc197c3bdffa2716ae493c67a5e7957";
    hash = "sha256-XX+0FUk2tXG7fklGT2pNsa4vUG+qYSDUMhB5HSAg6Ww=";
  };

  meta = {
    description = "EXPERIMENTAL";
    homepage = "https://github.com/roxma/vim-hug-neovim-rpc";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
