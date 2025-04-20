{
  path = ./.;
  myPkgs = [
    # keep-sorted start
    "pnut"
    # keep-sorted end
  ];
  nixPkgs = [
    # keep-sorted start
    "argbash"
    "argc"
    "bashly"
    "complgen"
    "jc"
    "shc"
    "shellcheck"
    "shfmt"
    "usage"
    "zx"
    # keep-sorted end
  ];
  nodePkgs = "bash-language-server";
}
