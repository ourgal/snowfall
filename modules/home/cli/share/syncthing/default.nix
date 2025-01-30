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
        todo = ln "${sync}/todo";
      };
      dataFiles = {
        task = ln "${sync}/task";
        nap = ln "${sync}/nap";
        buku = ln "${sync}/buku";
        jrnl = ln "${sync}/jrnl";
      };
      files = {
        Music = ln "${sync}/music";
        Documents = ln "${sync}/documents";
      };
    }
  )
)
