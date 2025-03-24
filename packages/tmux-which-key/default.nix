{
  tmuxPlugins,
  python3,
  _sources',
}:
tmuxPlugins.mkTmuxPlugin rec {
  pluginName = pname;
  inherit (_sources' ./.) pname version src;
  rtpFilePath = "plugin.sh.tmux";

  preInstall = ''
    patchShebangs plugin/build.py
    substituteInPlace plugin/build.py \
      --replace-fail 'from pyyaml.lib import yaml' 'import yaml'
  '';

  buildInputs = [ (python3.withPackages (ps: [ ps.pyyaml ])) ];
}
