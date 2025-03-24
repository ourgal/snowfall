{
  lib,
  fishPlugins,
  _sources',
}:

fishPlugins.buildFishPlugin {
  inherit (_sources' ./.) pname src version;

  meta = {
    description = "Automatically change the directory in fish after closing ranger";
    homepage = "https://github.com/sei40kr/fish-ranger-cd";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
