args:
args.module (
  args
  // {
    progs.doom-emacs.extraPackages = epkgs: [
      # (epkgs.melpaBuild {
      #   inherit (args.pkgs._sources.emacs-magit-delta) pname version src;
      #   packageRequires = with epkgs; [
      #     dash
      #     magit
      #     xterm-color
      #   ];
      # })
      epkgs.magit-delta
    ];
  }
)
