args:
args.module (
  args
  // (
    let
      inherit (args) config lib namespace;
      user = config.${namespace}.user.name;
    in
    {
      progs.notmuch = {
        new.tags = [ "new" ];
        search.excludeTags = [
          "trash"
          "spam"
        ];
      };
      enable = [
        # keep-sorted start
        "afew"
        "lieer"
        # keep-sorted end
      ];
      value = {
        accounts.email.accounts.zxc = rec {
          primary = true;
          flavor = "gmail.com";
          realName = user;
          address = lib.strings.fileContents ./gmail.key;
          userName = address;
          maildir.path = "gmail";
          notmuch.enable = config.programs.notmuch.enable;
          lieer.enable = config.services.lieer.enable;
          lieer.sync.enable = true;
        };
      };
    }
  )
)
