{
  lib,
  emacsPackages,
  _sources',
}:
emacsPackages.melpaBuild {
  inherit (_sources' ./.) pname version src;

  meta = {
    description = "Search the word at point with Zeal (Emacs";
    homepage = "https://github.com/jinzhu/zeal-at-point";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
