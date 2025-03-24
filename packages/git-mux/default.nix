{
  lib,
  stdenv,
  installShellFiles,
  makeWrapper,
  git,
  tmux,
  _sources',
}:

stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version src;

  nativeBuildInputs = [
    installShellFiles
    makeWrapper
  ];

  dontBuild = true;

  installPhase = ''
    install -Dm755 bin/git-mux $out/bin/git-mux
    wrapProgram $out/bin/git-mux --prefix PATH:${
      lib.makeBinPath [
        git
        tmux
      ]
    }
    installManPage bin/man/man1/git-mux.1
  '';

  meta = with lib; {
    description = "A git + tmux lovechild for blazingly fast movement between projects and tasks";
    homepage = "https://github.com/benelan/git-mux";
    changelog = "https://github.com/benelan/git-mux/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-mux";
    platforms = platforms.all;
  };
}
