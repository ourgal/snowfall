args:
args.module (
  args
  // (
    let
      inherit (args) namespace pkgs lib;
    in
    {
      progs.fish = {
        plugins = lib.${namespace}.mkFishPlugins [ "slashslash-fish" ] pkgs;
        interactiveShellInit = ''
          # slashslash-fish
          slashslash plugin --unregister buck
          slashslash enable make
        '';
      };
    }
  )
)
