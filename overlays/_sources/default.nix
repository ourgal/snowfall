_: self: _super: {
  _sources = import ../../_sources/generated.nix {
    inherit (self)
      fetchurl
      fetchgit
      fetchFromGitHub
      dockerTools
      ;
  };
}
