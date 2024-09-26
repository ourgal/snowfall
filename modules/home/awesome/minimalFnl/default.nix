{ ... }@args:
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
            cp $src/*.fnl $out
            mkdir -p $out/keys
            cp $src/keys/*.fnl $out/keys
            mkdir -p $out/rules
            cp $src/rules/*.fnl $out/rules
            mkdir -p $out/themes/default
            cp $src/themes/default/*.fnl $out/themes/default
            make -C $out
            find $out -name "*.fnl" -delete
            rm $out/Makefile
          '';
    in
    {
      path = ./.;
      confs.awesome = conf;
    }
  )
)
