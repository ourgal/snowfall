{
  lib,
  emacsPackages,
  _sources',
}:
emacsPackages.melpaBuild {
  inherit (_sources' ./.) pname version src;

  meta = {
    description = "Plugin for the Emacs editor to be used with the Git Time Metric platform";
    homepage = "https://github.com/c301/gtm-emacs-plugin";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
