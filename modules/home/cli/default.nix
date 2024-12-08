args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "pipx"
      # keep-sorted end
    ];
    files = {
      ".ssh./.keep" = "";
    };
    enable = [
      # keep-sorted start
      "AI"
      "anime"
      "audio"
      "blueteeth"
      "bookmark"
      "browser"
      "chat"
      "clipboard"
      "completion"
      "dashboard"
      "disk"
      "doc"
      "download"
      "editor"
      "encrypt"
      "file-manager"
      "font"
      "fun"
      "game"
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
