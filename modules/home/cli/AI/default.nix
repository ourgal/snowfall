args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "piper-tts"
      "tgpt"
      # keep-sorted end
    ];
    enable = "aichat";
  }
)
