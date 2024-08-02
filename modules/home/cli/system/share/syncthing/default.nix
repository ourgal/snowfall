{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    servs = {
      syncthing = {
        extraOptions = [ "--no-default-folder" ];
      };
    };
    value =
      with args;
      let
        sync = "${config.xdg.dataHome}/syncthing";
        ln = config.lib.file.mkOutOfStoreSymlink;
      in
      {
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
      };
  }
)
