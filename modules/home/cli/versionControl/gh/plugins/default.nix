args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      progs.gh.extensions =
        [
          pkgs.gh-dash
          pkgs.gh-eco
          pkgs.gh-f
          pkgs.gh-s
          pkgs.gh-markdown-preview
        ]
        ++ [
          pkgs.${namespace}.gh-branch
          pkgs.${namespace}.gh-cp
          pkgs.${namespace}.gh-screensaver
          pkgs.${namespace}.gh-stars
          pkgs.${namespace}.gh-poi
        ];
    }
  )
)
