args:
args.module (
  args
  // (
    let
      inherit (args) config namespace lib;
      inherit (config.${namespace}.desktop.editor) emacs;
    in
    {
      path = ./.;
      progs.emacs = {
        extraPackages =
          epkgs: with epkgs; [
            evil
            evil-leader
            evil-nerd-commenter
            evil-surround
            evil-collection
          ];
        extraConfig = builtins.concatStringsSep "" (
          [ (builtins.readFile ./config.el) ]
          ++ [ (builtins.readFile ./evil-nerd-commenter.el) ]
          ++ [ (builtins.readFile ./evil-surround.el) ]
          ++ [ (builtins.readFile ./evil-collection.el) ]
          ++ lib.optional emacs.helpful.enable (builtins.readFile ./helpful.el)
          ++ lib.optional emacs.eldoc-box.enable (builtins.readFile ./eldoc-box.el)
          ++ lib.optional emacs.fzf.enable (builtins.readFile ./fzf.el)
        );
      };
    }
  )
)
