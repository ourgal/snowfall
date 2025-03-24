{
  lib,
  stdenv,
  _sources',
}:
stdenv.mkDerivation {
  inherit (_sources' ./.) pname src version;

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
