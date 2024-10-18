args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "todo-txt-cli";
    files.".todo" = ./config;
    env.TODOTXT_DEFAULT_ACTION = "ls";
    progs.fish.functions.todo = {
      body = # fish
        ''
          command todo.sh $argv
        '';
      description = "todo.sh txt cli";
    };
  }
)
