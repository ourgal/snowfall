args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
      dicts =
        pkgs.runCommand "koreader_dicts"
          {
            inherit (pkgs._sources.stardict-cn-dicts) src;
            nativeBuildInputs = [ pkgs.${namespace}.v2dat ];
          }
          ''
            mkdir $out
            for file in $src/*.tar.xz; do
              tar -xvf "$file" --directory=$out
            done
          '';
    in
    {
      path = ./.;
      nixPkgs = "koreader";
      confs."koreader/data/dict" = dicts;
    }
  )
)
