{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      path = ./.;
      progs = {
        vim = {
          plugins = with pkgs.${namespace}; [ parinfer-rust ];
          extraConfig = ''
            let g:parinfer_dylib_path = expand("~/.nix-profile/lib/libparinfer_rust.so")
          '';
        };
      };
    }
  )
)
