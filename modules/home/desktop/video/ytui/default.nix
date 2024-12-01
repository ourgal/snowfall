args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "ytui";
    confs."ytui/config.yaml" = {
      channels = {
        local = true;
        subscribed = [
          "UCTt2AnK--mnRmICnf-CCcrw"
          "UCutXfzLC5wrV3SInT_tdY0w"
        ];
      };
      invidious = {
        instance = "invidious.jing.rocks";
      };
      loglevel = "info";
    };
  }
)
