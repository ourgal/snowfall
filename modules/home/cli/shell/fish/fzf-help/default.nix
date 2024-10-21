args:
args.module (
  args
  // (
    let
      inherit (args) namespace pkgs;
    in
    {
      path = ./.;
      progs.fish.interactiveShellInit = ''
        source ${pkgs.${namespace}.fzf-help}/lib/fzf-help.fish
        bind --mode insert \ca fzf-help-widget
      '';
    }
  )
)
