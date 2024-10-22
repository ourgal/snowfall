args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "cmdx";
    nixPkgs = [
      # keep-sorted start
      "gnumake"
      "pipx"
      "runme" # https://github.com/stateful/runme/issues/647#issuecomment-2327538200
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
      "network"
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
      "system"
      "task"
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
