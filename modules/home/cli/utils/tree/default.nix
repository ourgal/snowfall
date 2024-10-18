args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "tre-command";
    progs.fish.functions.tre = {
      body = "command tre $argv -e; and source /tmp/tre_aliases_$USER ^/dev/null";
      description = "Tree";
    };
  }
)
