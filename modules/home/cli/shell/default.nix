{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "choose"
      "circumflex"
      "didyoumean"
      "doge"
      "fpp"
      "fzf"
      "fzf-make"
      "fzy"
      "glow"
      "halp"
      "handlr"
      "mprocs"
      "nerdfix"
      "pet"
      "pinentry-all"
      "poop"
      "qrscan"
      "skate"
      "skim"
      "tmate"
      "tsukae"
      "vtm"
      "wtf"
      "yank"
      "zf"
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "fzf-kill"
      "lobtui"
      "play"
      "reader"
      "wush"
      "zfind"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "asciiart"
      "atuin"
      "broot"
      "carapace"
      "cod"
      "fish"
      "lazycli"
      "lesspipe"
      "navi"
      "nushell"
      "ov"
      "rbw"
      "serpl"
      "starship"
      "string"
      "tealdeer"
      "tere"
      "tmux"
      "utils"
      "zoxide"
      "zsh"
      # keep-sorted end
    ];
    value = with args; {
      ${namespace}.cli.shell.tmux = {
        resurrect = enabled;
        theme = lib.mkIf (config.catppuccin.enable != true) "dracula";
      };
    };
  }
)
