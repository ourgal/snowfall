{
  path = ./.;
  nixPkgs = [
    # keep-sorted start
    "as-tree"
    "tre-command"
    # keep-sorted end
  ];
  progs.fish.functions.tre = {
    body = "command tre $argv -e; and source /tmp/tre_aliases_$USER ^/dev/null";
    description = "Tree";
  };
}
