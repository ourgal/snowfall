{
  lib,
  stdenv,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "git-issue";
  source = lib.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit pname;
  version = "unstable-${source.date}";

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  makeFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    description = "Git-based decentralized issue management";
    homepage = "https://github.com/dspinellis/git-issue";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-issue";
    platforms = platforms.all;
  };
}
