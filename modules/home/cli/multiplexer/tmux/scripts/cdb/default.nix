args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      progs.fish = {
        functions.cdb = {
          body = ''
            set dir (${pkgs.${namespace}.find-buffer-path})
            if test -n $dir
               cd $dir
            end
          '';
          description = "cd buffer path";
        };
      };
    }
  )
)
