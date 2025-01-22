# cli datebase

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
```

## skate

Personal multi-machine syncable key value store.
[github](https://github.com/charmbracelet/skate)
`$ skate --help`

```
Skate, a personal key value store.

Usage:
  skate [flags]
  skate [command]

Available Commands:
  delete      Delete a key with an optional @ db.
  delete-db   Delete a database
  get         Get a value for a key with an optional @ db.
  help        Help about any command
  list        List key value pairs with an optional @ db.
  list-dbs    List databases.
  set         Set a value for a key with an optional @ db.

Flags:
  -h, --help      help for skate
  -v, --version   version for skate

Use "skate [command] --help" for more information about a command.
```

```nix tangle:default.nix
    nixPkgs = "skate";
  }
)
```
