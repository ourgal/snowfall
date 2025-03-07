args:
args.module (
  args
  // {
    path = ./.;
    progs.doom-emacs.extraPackages = epkgs: [
      (epkgs.melpaBuild {
        inherit (args.pkgs._sources.emacs-magit-delta) pname version src;
        packageRequires = with epkgs; [
          dash
          magit
          xterm-color
        ];
      })
    ];
  }
)
