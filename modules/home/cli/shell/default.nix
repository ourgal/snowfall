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
      "neo"
      "nerdfix"
      "nyancat"
      "pet"
      "pipes"
      "poop"
      "sad"
      "skate"
      "skim"
      "sttr"
      "termshot"
      "tmate"
      "tmatrix"
      "viddy"
      "vtm"
      "wtf"
      "yank"
      "zf"
    ];
    myPkgs = [
      "fzfp"
      "zfind"
    ];
    enable = [
      "atuin"
      "broot"
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
      "tere"
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
