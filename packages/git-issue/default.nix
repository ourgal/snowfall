{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation {
  pname = "git-issue";
  version = "unstable-2024-05-16";

  src = fetchFromGitHub {
    owner = "dspinellis";
    repo = "git-issue";
    rev = "d056998566d30235072b97982756ff607e9ecce9";
    hash = "sha256-VYMIgJRcXKlhX05tfILA8dB8x3lcR6nX6vdls79cAgA=";
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
