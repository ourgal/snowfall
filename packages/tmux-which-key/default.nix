{
  tmuxPlugins,
  python3,
  _sources,
}:
let
  pluginName = "tmux-which-key";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "plugin.sh.tmux";

  preInstall = ''
    patchShebangs plugin/build.py
    substituteInPlace plugin/build.py \
      --replace-fail 'from pyyaml.lib import yaml' 'import yaml'
  '';

  buildInputs = [ (python3.withPackages (ps: [ ps.pyyaml ])) ];
}
