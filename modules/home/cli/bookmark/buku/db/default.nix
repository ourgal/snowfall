args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      db =
        pkgs.runCommandNoCC "bukuDB" { buildInputs = [ (pkgs.python3.withPackages (ps: [ ps.pandas ])) ]; }
          ''
            python ${./db.key}
            mv bookmarks.db $out
          '';
    in
    {
      dataFiles."buku/bookmarks.db" = db;
    }
  )
)
