{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "gnumake"
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
      "asciiart"
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
