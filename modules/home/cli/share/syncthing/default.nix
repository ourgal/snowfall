args:
args.module (
  args
  // (
    let
      inherit (args) config pkgs;
      ln = config.lib.file.mkOutOfStoreSymlink;
      sync = "/var/lib/syncthing";
    in
    {
      path = ./.;
      progs.fish.functions.stc = {
        body = "${pkgs.stc-cli}/bin/stc --homedir=${sync} $argv";
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
