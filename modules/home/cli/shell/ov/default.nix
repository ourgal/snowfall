{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "ov";
    progs = with args; {
      git = {
        extraConfig = {
          delta = enableOpt [
            "navigate"
            "side-by-side"
            "file-yellow"
          ];
          # paper.log = "ov -F --section-delimiter '^commit' --section-header-num 3"; # 0.33.0
          paper.log = "ov -F --section-delimiter '^commit'";
        };
      };
    };
    confs = {
      ov = ./config.yaml;
    };
    env = {
      DELTA_PAGER = "ov --section-delimiter '^(commit|added:|removed:|renamed:|Δ)' --section-header --pattern '•'";
    };
  }
)
