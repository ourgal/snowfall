args:
args.module (
  args
  // (
    let
      inherit (args) host lib;
      isHome = host == "home";
      keyboard = lib.optional isHome "keyboard";
    in
    {
      enable = [
        # keep-sorted start
        "anime"
        "audio"
        "browser"
        "chat"
        "document"
        "flashcard"
        "git"
        "image"
        "math"
        "search"
        "system"
        "terminal"
        "translate"
        "versionControl"
        "video"
        "xprofile"
        # keep-sorted end
      ] ++ keyboard;
    }
  )
)
