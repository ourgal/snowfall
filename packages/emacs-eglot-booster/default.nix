{
  lib,
  emacsPackages,
  _sources',
}:

emacsPackages.melpaBuild {
  inherit (_sources' ./.) pname version src;

  meta = {
    description = "Boost eglot using lsp-booster";
    homepage = "https://github.com/jdtsmith/eglot-booster";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
