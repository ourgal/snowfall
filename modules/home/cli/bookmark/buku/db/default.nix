args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib namespace;
      inherit (lib.${namespace}) mkOpt';
      db =
        pkgs.runCommand "bukuDB" { buildInputs = [ (pkgs.python3.withPackages (ps: [ ps.pandas ])) ]; }
          ''
            python ${./db.key}
            mv bookmarks.db $out
          '';
    in
    {
      dataFiles."buku/bookmarks.db" = db;
      extraOpts = {
        path = mkOpt' lib.types.package db;
      };
    }
  )
)
