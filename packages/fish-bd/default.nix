{
  lib,
  fishPlugins,
  _sources',
}:
fishPlugins.buildFishPlugin {
  inherit (_sources' ./.) pname version src;

  meta = with lib; {
    description = "Quickly go back to a parent directory up in your current working directory tree. Don't write 'cd ../../..' redundantly, use bd instead";
    homepage = "https://github.com/0rax/fish-bd";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
