args:
args.module (
  args
  // (
    let
      inherit (args) config pkgs;
      inherit (pkgs) stc-cli;
      inherit (config.xdg) configHome dataHome;
      ln = config.lib.file.mkOutOfStoreSymlink;
      sync = "${dataHome}/syncthing";
    in
    {
      path = ./.;
      progs.fish.functions.stc = {
        body = "${stc-cli}/bin/stc --homedir=${configHome}/syncthing $argv";
      };
      confs = {
        lazyvim = ln "${sync}/lazyvim";
        todo = ln "${sync}/todo";
        lvim = ln "${sync}/lvim";
      };
      dataFiles = {
        task = ln "${sync}/task";
        nap = ln "${sync}/nap";
        buku = ln "${sync}/buku";
        jrnl = ln "${sync}/jrnl";
      };
    }
  )
)
