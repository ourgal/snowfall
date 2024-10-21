args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      path = ./.;
      value = {
        home.packages = [
          (pkgs.mdformat.withPlugins (ps: [
            ps.mdformat-toc
            ps.mdformat-tables
            ps.mdformat-footnote
            ps.mdformat-frontmatter
            ps.mdformat-simple-breaks
            pkgs.${namespace}.mdformat-config
          ]))
        ];
      };
    }
  )
)
