{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      gitui = {
        keyConfig = ''
          (
              move_left: Some(( code: Char('h'), modifiers: "")),
              move_right: Some(( code: Char('l'), modifiers: "")),
              move_up: Some(( code: Char('k'), modifiers: "")),
              move_down: Some(( code: Char('j'), modifiers: "")),
              stage_unstage_item: Some(( code: Char(' '), modifiers: "")),

              open_help: Some(( code: F(1), modifiers: "")),
          )
        '';
      };
    };
  }
)
