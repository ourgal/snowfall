args:
args.module (
  args
  // {
    path = ./.;
    progs.zsh = {
      autocd = true;
      syntaxHighlighting.enable = true;
      antidote = {
        enable = true;
        plugins = [
          "zsh-users/zsh-autosuggestions"
          "hlissner/zsh-autopair"
          "MichaelAquilina/zsh-auto-notify"
          "Aloxaf/fzf-tab"
          "Freed-Wu/zsh-help"
        ];
      };
    };
  }
)
