{
  lib,
  emacsPackages,
  _sources',
}:
emacsPackages.melpaBuild {
  inherit (_sources' ./.) pname version src;

  meta = {
    description = "This repo is a mirror. Zoxide for finding file and open directory";
    homepage = "https://github.com/Vonfry/zoxide.el";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
