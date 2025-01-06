args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
      dicts =
        pkgs.runCommand "koreader_dicts"
          {
            src = pkgs._sources.stardict-cn-dicts.src;
            nativeBuildInputs = [
              pkgs.${namespace}.v2dat
            ];
          }
          ''
            mkdir $out
            tar -xvf $src/stardict-quick_eng-zh_CN-2.4.2.tar.xz \
                --directory=$out
          '';
    in
    {
      path = ./.;
      nixPkgs = "koreader";
      confs."koreader/data/dict" = dicts;
    }
  )
)
