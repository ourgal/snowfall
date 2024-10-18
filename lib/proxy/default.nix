_: {
  proxy = {
    go = {
      GOPROXY = "https://goproxy.cn";
    };
    rust = {
      NIX_CRATES_INDEX = "sparse+https://mirrors.cernet.edu.cn/crates.io-index/";
    };
  };
}
