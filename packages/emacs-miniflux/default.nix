{ emacsPackages, _sources' }:

emacsPackages.melpaBuild {
  inherit (_sources' ./.) pname version src;
  packageRequires = [ emacsPackages.request ];
}
