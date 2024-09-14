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
      files = {
        ".vim" = ln "${sync}/vim";
      };
      confs = {
        lazyvim = ln "${sync}/lazyvim";
        doom = ln "${sync}/doom";
        todo = ln "${sync}/todo";
        lvim = ln "${sync}/lvim";
      };
      dataFiles = {
        task = ln "${sync}/task";
        nap = ln "${sync}/nap";
      };
      value = {
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
