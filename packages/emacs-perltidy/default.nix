{
  lib,
  emacsPackages,
  _sources',
}:
emacsPackages.melpaBuild {
  inherit (_sources' ./.) pname version src;

  meta = {
    description = "Tidy Perl code in Emacs";
    homepage = "https://github.com/perl-ide/perltidy.el";
    license = lib.licenses.gpl2Plus;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
