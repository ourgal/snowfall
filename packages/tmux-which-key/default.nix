{ pkgs, ... }:
let
  py = pkgs.python3.withPackages (ps: with ps; [ pyyaml ]);
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "tmux-which-key";
  version = "unstable-2024-07-09";
  rtpFilePath = "plugin.sh.tmux";
  src = pkgs.fetchFromGitHub {
    owner = "alexwforsythe";
    repo = "tmux-which-key";
    rev = "1f419775caf136a60aac8e3a269b51ad10b51eb6";
    hash = "sha256-X7FunHrAexDgAlZfN+JOUJvXFZeyVj9yu6WRnxMEA8E=";
  };
  postInstall = ''
    sed -i -e 's|python3 |${py}/bin/python3 |g' $target/plugin.sh.tmux
    sed -i -e 's|python3 |${py}/bin/python3 |g' $target/plugin/build.py
  '';
}
