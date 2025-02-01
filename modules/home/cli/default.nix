args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      path = ./.;
      tmpfiles = [ "d ${config.home.homeDirectory}/.ssh - - - - -" ];
      enable = [
        # keep-sorted start
        "AI"
        "anime"
        "audio"
        "bluetooth"
        "bookmark"
        "browser"
        "chat"
        "clipboard"
        "completion"
        "correction"
        "dashboard"
        "disk"
        "doc"
        "download"
        "editor"
        "encrypt"
        "epub"
        "file-manager"
        "font"
        "fun"
        "grammar"
        "history"
        "image"
        "mail"
        "math"
        "meme"
        "multiplexer"
        "nix"
        "note"
        "notification"
        "presentation"
        "prompt"
        "qrcode"
        "reader"
        "recording"
        "rss"
        "runner"
        "search"
        "share"
        "shell"
        "snippet"
        "ssh"
        "stats"
        "string"
        "system"
        "task"
        "time-tracking"
        "timezone"
        "translate"
        "tui"
        "utils"
        "versionControl"
        "video"
        "zip"
        # keep-sorted end
      ];
    }
  )
)
