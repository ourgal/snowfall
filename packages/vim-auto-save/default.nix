{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin {
  pname = "vim-auto-save";
  version = "unstable-2024-07-15";

  src = fetchFromGitHub {
    owner = "ourgal";
    repo = "vim-auto-save";
    rev = "6697e84b25f6a56c36d0c5ae9004b8b9247662ea";
    hash = "sha256-hP3s7iIfGjLMYF6lqnL6ORGqmPfM0d2BCdW4OSqg4ac=";
  };

  meta = with lib; {
    description = "A Vim plugin which saves files to disk automatically";
    homepage = "https://github.com/ourgal/vim-auto-save";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
