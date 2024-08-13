{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "choose"
      "doge"
      "fpp"
      "fzf"
      "fzy"
      "glow"
      "halp"
      "handlr"
      "mprocs"
      "nerdfix"
      "pet"
      "poop"
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
    myPkgs = "zfind";
    enable = [
      # keep-sorted start
      "asciiart"
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
