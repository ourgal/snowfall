{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        lib
        pkgs
        namespace
        ;
      inherit (pkgs) stc-cli;
      inherit (lib.${namespace}) switch cfgHome;
      inherit (config.xdg) configHome dataHome;
      ln = config.lib.file.mkOutOfStoreSymlink;
      sync = "${dataHome}/syncthing";
      cfg = cfgHome config.${namespace} ./.;
    in
    {
      path = ./.;
      progs = {
        fish = {
          functions = {
            stc = {
              body = "${stc-cli}/bin/stc --homedir=${configHome}/syncthing $argv";
            };
          };
        };
      };
      value = {
        home.file = {
          ".vim".source = ln "${sync}/vim";
        };
        xdg = {
          configFile = {
            lazyvim.source = ln "${sync}/lazyvim";
            doom.source = ln "${sync}/doom";
            todo.source = ln "${sync}/todo";
            lvim.source = ln "${sync}/lvim";
          };
          dataFile = {
            task.source = ln "${sync}/task";
            nap.source = ln "${sync}/nap";
          };
        };
        services.syncthing = {
          enable = cfg.service.enable;
          extraOptions = [ "--no-default-folder" ];
        };
      };
      extraOpts = {
        service = switch;
      };
    }
  )
)
