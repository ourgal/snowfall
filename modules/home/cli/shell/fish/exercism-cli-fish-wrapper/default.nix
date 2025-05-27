args:
args.module (
  args
  // (
    let
      inherit (args) namespace lib pkgs;
    in
    {
      progs.fish = {
        interactiveShellInit = # fish
          ''
            set exercism_wrapper_home /path/to/the/exercism/wrapper/root
            if not contains $exercism_wrapper_home/functions $fish_function_path
                set fish_function_path $exercism_wrapper_home/functions $fish_function_path
            end
            if not contains $exercism_wrapper_home/completions $fish_complete_path
                set fish_complete_path $exercism_wrapper_home/completions $fish_complete_path
            end
            set -e exercism_wrapper_home
          '';
        plugins = lib.${namespace}.mkFishPlugins [ "exercism-cli-fish-wrapper" ] pkgs;
      };
      nixPkgs = [
        "pup"
        "jq"
        "curl"
        "miller"
        "miller"
      ];
    }
  )
)
