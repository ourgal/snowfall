{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args)
        lib
        config
        enabled
        namespace
        ;
    in
    {
      path = ./.;
      nixPkgs = [
        # keep-sorted start
        "asciinema"
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
        "vhs"
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
        "rat"
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
        "buku"
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
      value = {
        ${namespace}.cli.shell.tmux = {
          resurrect = enabled;
          theme = lib.mkIf (config.catppuccin.enable != true) "dracula";
        };
      };
    }
  )
)
