args:
args.module (
  args
  // (
    let
      fileManager = "ranger";
    in
    {
      progs.fish = {
        interactiveShellInit = # fish
          ''
            if test $fish_key_bindings = fish_vi_key_bindings
              bind --mode insert \cf '${fileManager}'
            else
              bind \cf '${fileManager}'
            end
          '';
        functions.ranger = {
          body = ''
            set tempfile (mktemp -t tmp.XXXXXX)
            set command_argument "map Q chain shell echo %d > $tempfile; quitall"
            command ranger --cmd="$command_argument" $argv
            if test -s $tempfile
              set ranger_pwd (cat $tempfile)
              if test -n $ranger_pwd -a -d $ranger_pwd
                builtin cd -- $ranger_pwd
              end
            end

            command rm -f -- $tempfile
          '';
        };
      };
    }
  )
)
