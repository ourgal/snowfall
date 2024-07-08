{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "bat"
      "bfs"
      "choose"
      "doge"
      "figlet"
      "fpp"
      "fzf"
      "fzy"
      "genact"
      "glow"
      "hwatch"
      "hyperfine"
      "lolcat"
      "mprocs"
      "nap"
      "neo"
      "nerdfix"
      "nyancat"
      "pet"
      "pipes"
      "sad"
      "skate"
      "sttr"
      "termshot"
      "tmate"
      "tmatrix"
      "viddy"
      "vtm"
      "wtf"
      "yank"
    ];
    myPkgs = "fzfp";
    enable = [
      "atuin"
      "carapace"
      "cod"
      "fish"
      "lesspipe"
      "navi"
      "nushell"
      "ov"
      "serpl"
      "starship"
      "tealdeer"
      "tmux"
      "zoxide"
      "zsh"
    ];
    value = with args; {
      ${namespace}.cli.shell.tmux = {
        resurrect = enabled;
        theme = lib.mkIf (config.catppuccin.enable != true) "dracula";
      };
    };
  }
)
