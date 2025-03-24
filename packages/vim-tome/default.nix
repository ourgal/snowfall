{
  lib,
  _sources',
  vimUtils,
}:
vimUtils.buildVimPlugin {
  inherit (_sources' ./.) pname version src;

  meta = with lib; {
    description = "Script playbooks for frequent commands in any terminal application";
    homepage = "https://github.com/laktak/tome";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
