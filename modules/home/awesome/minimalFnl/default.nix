args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      conf =
        pkgs.runCommand "awesome-minimalFnl"
          {
            src = ./config;
            nativeBuildInputs = [
              pkgs.gnumake
              pkgs.fennel
            ];
          }
          ''
            mkdir $out
            cp $src/Makefile $out
            mkdir -p $out/{keys,rules,themes/default}
            cp -r --update=none $src/* $out
            make -C $out
            find $out -name "*.fnl" -delete
            rm $out/Makefile
          '';
    in
    {
      confs.awesome = conf;
    }
  )
)
